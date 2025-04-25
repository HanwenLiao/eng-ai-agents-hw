(define (problem route-request-problem)
  (:domain openrouter-routing)
  (:objects
    gpt4 llama2 - model
    openai meta - provider
    user1 - user
    req1 - request
    coding multilingual - capability
    tok2000 tok8000 - tokens
    price10 - price
    budget20 - budget
    free beta - variant
  )

  (:init
    ;; 模型能力
    (supports gpt4 coding)
    (supports gpt4 multilingual)
    (supports llama2 multilingual)

    ;; 提供商信息
    (offered-by gpt4 openai)
    (offered-by llama2 meta)

    ;; 模型状态
    (model-available gpt4)
    (model-available llama2)

    ;; 请求要求
    (can-handle gpt4 req1)
    (can-handle llama2 req1)
    (requires req1 coding)

    ;; token 与预算
    (request-tokens req1 tok2000)
    (max-tokens gpt4 tok8000)
    (max-tokens llama2 tok8000)
    (token-compatible tok2000 tok8000)

    ;; 价格和预算约束
    (price-per-million gpt4 openai price10)
    (user-budget user1 budget20)
    (within-budget price10 budget20)

    ;; 模型变体信息（可选扩展）
    (variant-of gpt4 free)
    (variant-of llama2 beta)
    (provider-supports-variant openai free)
    (provider-supports-variant meta beta)
    (model-supports-variant gpt4 free)
    (model-supports-variant llama2 beta)
  )

  (:goal (and
    (assigned req1 gpt4)
  ))
)
