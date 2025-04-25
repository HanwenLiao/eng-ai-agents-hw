(define (domain openrouter-routing)
  (:requirements :strips :typing)
  (:types
    model provider request capability user price budget tokens variant
  )

  (:predicates
    (supports ?model - model ?capability - capability)
    (offered-by ?model - model ?provider - provider)
    (requires ?request - request ?capability - capability)
    (can-handle ?model - model ?request - request)
    (model-available ?model - model)
    (assigned ?request - request ?model - model)
    (max-tokens ?model - model ?max_tokens - tokens)
    (request-tokens ?request - request ?used_tokens - tokens)
    (token-compatible ?used_tokens - tokens ?max_tokens - tokens)
    (price-per-million ?model - model ?provider - provider ?price - price)
    (user-budget ?user - user ?budget_limit - budget)
    (within-budget ?price - price ?budget_limit - budget)
    (variant-of ?model - model ?variant - variant)
    (provider-supports-variant ?provider - provider ?variant - variant)
    (model-supports-variant ?model - model ?variant - variant)
  )

  (:action assign-model
    :parameters (
      ?m - model
      ?r - request
      ?used - tokens
      ?max - tokens
      ?c - capability
      ?p - provider
      ?pr - price
      ?budget - budget
      ?u - user
    )
    :precondition (and
      (can-handle ?m ?r)
      (model-available ?m)
      (supports ?m ?c)
      (requires ?r ?c)
      (request-tokens ?r ?used)
      (max-tokens ?m ?max)
      (token-compatible ?used ?max)
      (offered-by ?m ?p)
      (price-per-million ?m ?p ?pr)
      (user-budget ?u ?budget)
      (within-budget ?pr ?budget)
    )
    :effect (and
      (assigned ?r ?m)
    )
  )

  (:action assign-model-with-variant
    :parameters (
      ?m - model
      ?r - request
      ?used - tokens
      ?max - tokens
      ?c - capability
      ?p - provider
      ?pr - price
      ?v - variant
      ?budget - budget
      ?u - user
    )
    :precondition (and
      (can-handle ?m ?r)
      (model-available ?m)
      (supports ?m ?c)
      (requires ?r ?c)
      (request-tokens ?r ?used)
      (max-tokens ?m ?max)
      (token-compatible ?used ?max)
      (offered-by ?m ?p)
      (price-per-million ?m ?p ?pr)
      (user-budget ?u ?budget)
      (within-budget ?pr ?budget)
      (variant-of ?m ?v)
      (provider-supports-variant ?p ?v)
      (model-supports-variant ?m ?v)
    )
    :effect (and
      (assigned ?r ?m)
    )
  )
)
