(define (problem assign-request)
  (:domain openrouter-routing)
  (:objects
    req1 - request
    code - capability
    tok2000 - tokens
    budget100 - budget
    user1 - user
    model_qwen_qwen3_235b_a22b_free_72ca4c - model
    prov_qwen_qwen3_235b_a22b_free__qwen_c6b9df - provider
    var_qwen_qwen3_235b_a22b_free__free_9d2928 - variant
    tok_40960_a422a1 - tokens
    price_0_cfcd20 - price
    model_thudm_glm_z1_9b_free_94e005 - model
    prov_thudm_glm_z1_9b_free__thudm_b21219 - provider
    var_thudm_glm_z1_9b_free__free_31cfa4 - variant
    tok_32000_10e4d7 - tokens
    model_thudm_glm_z1_32b_free_250344 - model
    prov_thudm_glm_z1_32b_free__thudm_91b9d9 - provider
    var_thudm_glm_z1_32b_free__free_733b94 - variant
    tok_32768_f43764 - tokens
    model_thudm_glm_4_32b_free_bdf5b0 - model
    prov_thudm_glm_4_32b_free__thudm_797f12 - provider
    var_thudm_glm_4_32b_free__free_5edb07 - variant
    model_agentica_org_deepcoder_14b_preview_free_df4b52 - model
    prov_agentica_org_deepcoder_14b_preview_free__agentica_org_1288c5 - provider
    var_agentica_org_deepcoder_14b_preview_free__free_531b5f - variant
    tok_96000_d81479 - tokens
    model_moonshotai_kimi_vl_a3b_thinking_free_899094 - model
    prov_moonshotai_kimi_vl_a3b_thinking_free__moonshotai_a41bf6 - provider
    var_moonshotai_kimi_vl_a3b_thinking_free__free_a84a2a - variant
    tok_131072_f7de59 - tokens
    model_meta_llama_llama_4_maverick_free_f0df6a - model
    prov_meta_llama_llama_4_maverick_free__meta_llama_9e6d64 - provider
    var_meta_llama_llama_4_maverick_free__free_6b997f - variant
    tok_256000_2fd324 - tokens
    model_meta_llama_llama_4_scout_free_8e6d44 - model
    prov_meta_llama_llama_4_scout_free__meta_llama_2e5b3b - provider
    var_meta_llama_llama_4_scout_free__free_c0b8e7 - variant
    tok_512000_d09e1c - tokens
    model_allenai_molmo_7b_d_free_f5e3a6 - model
    prov_allenai_molmo_7b_d_free__allenai_3a769a - provider
    var_allenai_molmo_7b_d_free__free_973e2d - variant
    tok_4096_f7efa4 - tokens
    model_bytedance_research_ui_tars_72b_free_f2648f - model
    prov_bytedance_research_ui_tars_72b_free__bytedance_research_261d09 - provider
    var_bytedance_research_ui_tars_72b_free__free_f79f0c - variant
    model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 - model
    prov_qwen_qwen2_5_vl_32b_instruct_free__qwen_0b9f25 - provider
    var_qwen_qwen2_5_vl_32b_instruct_free__free_7e51fa - variant
    tok_8192_774412 - tokens
    model_open_r1_olympiccoder_32b_free_d8e8d0 - model
    prov_open_r1_olympiccoder_32b_free__open_r1_27a99a - provider
    var_open_r1_olympiccoder_32b_free__free_a4b4fb - variant
    model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e - model
    prov_deepseek_deepseek_r1_distill_qwen_32b_free__deepseek_004c51 - provider
    var_deepseek_deepseek_r1_distill_qwen_32b_free__free_d0394f - variant
    tok_16000_67510c - tokens
    model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 - model
    prov_deepseek_deepseek_r1_distill_qwen_14b_free__deepseek_a649b7 - provider
    var_deepseek_deepseek_r1_distill_qwen_14b_free__free_76051f - variant
    tok_64000_762e98 - tokens
    model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d - model
    prov_deepseek_deepseek_r1_distill_llama_70b_free__deepseek_eeeac2 - provider
    var_deepseek_deepseek_r1_distill_llama_70b_free__free_c41c6c - variant
    model_qwen_qwq_32b_preview_free_b1db62 - model
    prov_qwen_qwq_32b_preview_free__qwen_71dbf3 - provider
    var_qwen_qwq_32b_preview_free__free_ae3976 - variant
    tok_16384_c76fe1 - tokens
    model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 - model
    prov_qwen_qwen_2_5_coder_32b_instruct_free__qwen_60565c - provider
    var_qwen_qwen_2_5_coder_32b_instruct_free__free_0633bb - variant
  )
  (:init
    (requires req1 code)
    (request-tokens req1 tok2000)
    (user-budget user1 budget100)
    (supports model_qwen_qwen3_235b_a22b_free_72ca4c code)
    (can-handle model_qwen_qwen3_235b_a22b_free_72ca4c req1)
    (model-available model_qwen_qwen3_235b_a22b_free_72ca4c)
    (offered-by model_qwen_qwen3_235b_a22b_free_72ca4c prov_qwen_qwen3_235b_a22b_free__qwen_c6b9df)
    (variant-of model_qwen_qwen3_235b_a22b_free_72ca4c var_qwen_qwen3_235b_a22b_free__free_9d2928)
    (provider-supports-variant prov_qwen_qwen3_235b_a22b_free__qwen_c6b9df var_qwen_qwen3_235b_a22b_free__free_9d2928)
    (model-supports-variant model_qwen_qwen3_235b_a22b_free_72ca4c var_qwen_qwen3_235b_a22b_free__free_9d2928)
    (max-tokens model_qwen_qwen3_235b_a22b_free_72ca4c tok_40960_a422a1)
    (price-per-million model_qwen_qwen3_235b_a22b_free_72ca4c prov_qwen_qwen3_235b_a22b_free__qwen_c6b9df price_0_cfcd20)
    (token-compatible tok2000 tok_40960_a422a1)
    (within-budget price_0_cfcd20 budget100)
    (supports model_thudm_glm_z1_9b_free_94e005 code)
    (can-handle model_thudm_glm_z1_9b_free_94e005 req1)
    (model-available model_thudm_glm_z1_9b_free_94e005)
    (offered-by model_thudm_glm_z1_9b_free_94e005 prov_thudm_glm_z1_9b_free__thudm_b21219)
    (variant-of model_thudm_glm_z1_9b_free_94e005 var_thudm_glm_z1_9b_free__free_31cfa4)
    (provider-supports-variant prov_thudm_glm_z1_9b_free__thudm_b21219 var_thudm_glm_z1_9b_free__free_31cfa4)
    (model-supports-variant model_thudm_glm_z1_9b_free_94e005 var_thudm_glm_z1_9b_free__free_31cfa4)
    (max-tokens model_thudm_glm_z1_9b_free_94e005 tok_32000_10e4d7)
    (price-per-million model_thudm_glm_z1_9b_free_94e005 prov_thudm_glm_z1_9b_free__thudm_b21219 price_0_cfcd20)
    (token-compatible tok2000 tok_32000_10e4d7)
    (within-budget price_0_cfcd20 budget100)
    (supports model_thudm_glm_z1_32b_free_250344 code)
    (can-handle model_thudm_glm_z1_32b_free_250344 req1)
    (model-available model_thudm_glm_z1_32b_free_250344)
    (offered-by model_thudm_glm_z1_32b_free_250344 prov_thudm_glm_z1_32b_free__thudm_91b9d9)
    (variant-of model_thudm_glm_z1_32b_free_250344 var_thudm_glm_z1_32b_free__free_733b94)
    (provider-supports-variant prov_thudm_glm_z1_32b_free__thudm_91b9d9 var_thudm_glm_z1_32b_free__free_733b94)
    (model-supports-variant model_thudm_glm_z1_32b_free_250344 var_thudm_glm_z1_32b_free__free_733b94)
    (max-tokens model_thudm_glm_z1_32b_free_250344 tok_32768_f43764)
    (price-per-million model_thudm_glm_z1_32b_free_250344 prov_thudm_glm_z1_32b_free__thudm_91b9d9 price_0_cfcd20)
    (token-compatible tok2000 tok_32768_f43764)
    (within-budget price_0_cfcd20 budget100)
    (supports model_thudm_glm_4_32b_free_bdf5b0 code)
    (can-handle model_thudm_glm_4_32b_free_bdf5b0 req1)
    (model-available model_thudm_glm_4_32b_free_bdf5b0)
    (offered-by model_thudm_glm_4_32b_free_bdf5b0 prov_thudm_glm_4_32b_free__thudm_797f12)
    (variant-of model_thudm_glm_4_32b_free_bdf5b0 var_thudm_glm_4_32b_free__free_5edb07)
    (provider-supports-variant prov_thudm_glm_4_32b_free__thudm_797f12 var_thudm_glm_4_32b_free__free_5edb07)
    (model-supports-variant model_thudm_glm_4_32b_free_bdf5b0 var_thudm_glm_4_32b_free__free_5edb07)
    (max-tokens model_thudm_glm_4_32b_free_bdf5b0 tok_32768_f43764)
    (price-per-million model_thudm_glm_4_32b_free_bdf5b0 prov_thudm_glm_4_32b_free__thudm_797f12 price_0_cfcd20)
    (token-compatible tok2000 tok_32768_f43764)
    (within-budget price_0_cfcd20 budget100)
    (supports model_agentica_org_deepcoder_14b_preview_free_df4b52 code)
    (can-handle model_agentica_org_deepcoder_14b_preview_free_df4b52 req1)
    (model-available model_agentica_org_deepcoder_14b_preview_free_df4b52)
    (offered-by model_agentica_org_deepcoder_14b_preview_free_df4b52 prov_agentica_org_deepcoder_14b_preview_free__agentica_org_1288c5)
    (variant-of model_agentica_org_deepcoder_14b_preview_free_df4b52 var_agentica_org_deepcoder_14b_preview_free__free_531b5f)
    (provider-supports-variant prov_agentica_org_deepcoder_14b_preview_free__agentica_org_1288c5 var_agentica_org_deepcoder_14b_preview_free__free_531b5f)
    (model-supports-variant model_agentica_org_deepcoder_14b_preview_free_df4b52 var_agentica_org_deepcoder_14b_preview_free__free_531b5f)
    (max-tokens model_agentica_org_deepcoder_14b_preview_free_df4b52 tok_96000_d81479)
    (price-per-million model_agentica_org_deepcoder_14b_preview_free_df4b52 prov_agentica_org_deepcoder_14b_preview_free__agentica_org_1288c5 price_0_cfcd20)
    (token-compatible tok2000 tok_96000_d81479)
    (within-budget price_0_cfcd20 budget100)
    (supports model_moonshotai_kimi_vl_a3b_thinking_free_899094 code)
    (can-handle model_moonshotai_kimi_vl_a3b_thinking_free_899094 req1)
    (model-available model_moonshotai_kimi_vl_a3b_thinking_free_899094)
    (offered-by model_moonshotai_kimi_vl_a3b_thinking_free_899094 prov_moonshotai_kimi_vl_a3b_thinking_free__moonshotai_a41bf6)
    (variant-of model_moonshotai_kimi_vl_a3b_thinking_free_899094 var_moonshotai_kimi_vl_a3b_thinking_free__free_a84a2a)
    (provider-supports-variant prov_moonshotai_kimi_vl_a3b_thinking_free__moonshotai_a41bf6 var_moonshotai_kimi_vl_a3b_thinking_free__free_a84a2a)
    (model-supports-variant model_moonshotai_kimi_vl_a3b_thinking_free_899094 var_moonshotai_kimi_vl_a3b_thinking_free__free_a84a2a)
    (max-tokens model_moonshotai_kimi_vl_a3b_thinking_free_899094 tok_131072_f7de59)
    (price-per-million model_moonshotai_kimi_vl_a3b_thinking_free_899094 prov_moonshotai_kimi_vl_a3b_thinking_free__moonshotai_a41bf6 price_0_cfcd20)
    (token-compatible tok2000 tok_131072_f7de59)
    (within-budget price_0_cfcd20 budget100)
    (supports model_meta_llama_llama_4_maverick_free_f0df6a code)
    (can-handle model_meta_llama_llama_4_maverick_free_f0df6a req1)
    (model-available model_meta_llama_llama_4_maverick_free_f0df6a)
    (offered-by model_meta_llama_llama_4_maverick_free_f0df6a prov_meta_llama_llama_4_maverick_free__meta_llama_9e6d64)
    (variant-of model_meta_llama_llama_4_maverick_free_f0df6a var_meta_llama_llama_4_maverick_free__free_6b997f)
    (provider-supports-variant prov_meta_llama_llama_4_maverick_free__meta_llama_9e6d64 var_meta_llama_llama_4_maverick_free__free_6b997f)
    (model-supports-variant model_meta_llama_llama_4_maverick_free_f0df6a var_meta_llama_llama_4_maverick_free__free_6b997f)
    (max-tokens model_meta_llama_llama_4_maverick_free_f0df6a tok_256000_2fd324)
    (price-per-million model_meta_llama_llama_4_maverick_free_f0df6a prov_meta_llama_llama_4_maverick_free__meta_llama_9e6d64 price_0_cfcd20)
    (token-compatible tok2000 tok_256000_2fd324)
    (within-budget price_0_cfcd20 budget100)
    (supports model_meta_llama_llama_4_scout_free_8e6d44 code)
    (can-handle model_meta_llama_llama_4_scout_free_8e6d44 req1)
    (model-available model_meta_llama_llama_4_scout_free_8e6d44)
    (offered-by model_meta_llama_llama_4_scout_free_8e6d44 prov_meta_llama_llama_4_scout_free__meta_llama_2e5b3b)
    (variant-of model_meta_llama_llama_4_scout_free_8e6d44 var_meta_llama_llama_4_scout_free__free_c0b8e7)
    (provider-supports-variant prov_meta_llama_llama_4_scout_free__meta_llama_2e5b3b var_meta_llama_llama_4_scout_free__free_c0b8e7)
    (model-supports-variant model_meta_llama_llama_4_scout_free_8e6d44 var_meta_llama_llama_4_scout_free__free_c0b8e7)
    (max-tokens model_meta_llama_llama_4_scout_free_8e6d44 tok_512000_d09e1c)
    (price-per-million model_meta_llama_llama_4_scout_free_8e6d44 prov_meta_llama_llama_4_scout_free__meta_llama_2e5b3b price_0_cfcd20)
    (token-compatible tok2000 tok_512000_d09e1c)
    (within-budget price_0_cfcd20 budget100)
    (supports model_allenai_molmo_7b_d_free_f5e3a6 code)
    (can-handle model_allenai_molmo_7b_d_free_f5e3a6 req1)
    (model-available model_allenai_molmo_7b_d_free_f5e3a6)
    (offered-by model_allenai_molmo_7b_d_free_f5e3a6 prov_allenai_molmo_7b_d_free__allenai_3a769a)
    (variant-of model_allenai_molmo_7b_d_free_f5e3a6 var_allenai_molmo_7b_d_free__free_973e2d)
    (provider-supports-variant prov_allenai_molmo_7b_d_free__allenai_3a769a var_allenai_molmo_7b_d_free__free_973e2d)
    (model-supports-variant model_allenai_molmo_7b_d_free_f5e3a6 var_allenai_molmo_7b_d_free__free_973e2d)
    (max-tokens model_allenai_molmo_7b_d_free_f5e3a6 tok_4096_f7efa4)
    (price-per-million model_allenai_molmo_7b_d_free_f5e3a6 prov_allenai_molmo_7b_d_free__allenai_3a769a price_0_cfcd20)
    (token-compatible tok2000 tok_4096_f7efa4)
    (within-budget price_0_cfcd20 budget100)
    (supports model_bytedance_research_ui_tars_72b_free_f2648f code)
    (can-handle model_bytedance_research_ui_tars_72b_free_f2648f req1)
    (model-available model_bytedance_research_ui_tars_72b_free_f2648f)
    (offered-by model_bytedance_research_ui_tars_72b_free_f2648f prov_bytedance_research_ui_tars_72b_free__bytedance_research_261d09)
    (variant-of model_bytedance_research_ui_tars_72b_free_f2648f var_bytedance_research_ui_tars_72b_free__free_f79f0c)
    (provider-supports-variant prov_bytedance_research_ui_tars_72b_free__bytedance_research_261d09 var_bytedance_research_ui_tars_72b_free__free_f79f0c)
    (model-supports-variant model_bytedance_research_ui_tars_72b_free_f2648f var_bytedance_research_ui_tars_72b_free__free_f79f0c)
    (max-tokens model_bytedance_research_ui_tars_72b_free_f2648f tok_32768_f43764)
    (price-per-million model_bytedance_research_ui_tars_72b_free_f2648f prov_bytedance_research_ui_tars_72b_free__bytedance_research_261d09 price_0_cfcd20)
    (token-compatible tok2000 tok_32768_f43764)
    (within-budget price_0_cfcd20 budget100)
    (supports model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 code)
    (can-handle model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 req1)
    (model-available model_qwen_qwen2_5_vl_32b_instruct_free_278fd8)
    (offered-by model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 prov_qwen_qwen2_5_vl_32b_instruct_free__qwen_0b9f25)
    (variant-of model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 var_qwen_qwen2_5_vl_32b_instruct_free__free_7e51fa)
    (provider-supports-variant prov_qwen_qwen2_5_vl_32b_instruct_free__qwen_0b9f25 var_qwen_qwen2_5_vl_32b_instruct_free__free_7e51fa)
    (model-supports-variant model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 var_qwen_qwen2_5_vl_32b_instruct_free__free_7e51fa)
    (max-tokens model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 tok_8192_774412)
    (price-per-million model_qwen_qwen2_5_vl_32b_instruct_free_278fd8 prov_qwen_qwen2_5_vl_32b_instruct_free__qwen_0b9f25 price_0_cfcd20)
    (token-compatible tok2000 tok_8192_774412)
    (within-budget price_0_cfcd20 budget100)
    (supports model_open_r1_olympiccoder_32b_free_d8e8d0 code)
    (can-handle model_open_r1_olympiccoder_32b_free_d8e8d0 req1)
    (model-available model_open_r1_olympiccoder_32b_free_d8e8d0)
    (offered-by model_open_r1_olympiccoder_32b_free_d8e8d0 prov_open_r1_olympiccoder_32b_free__open_r1_27a99a)
    (variant-of model_open_r1_olympiccoder_32b_free_d8e8d0 var_open_r1_olympiccoder_32b_free__free_a4b4fb)
    (provider-supports-variant prov_open_r1_olympiccoder_32b_free__open_r1_27a99a var_open_r1_olympiccoder_32b_free__free_a4b4fb)
    (model-supports-variant model_open_r1_olympiccoder_32b_free_d8e8d0 var_open_r1_olympiccoder_32b_free__free_a4b4fb)
    (max-tokens model_open_r1_olympiccoder_32b_free_d8e8d0 tok_32768_f43764)
    (price-per-million model_open_r1_olympiccoder_32b_free_d8e8d0 prov_open_r1_olympiccoder_32b_free__open_r1_27a99a price_0_cfcd20)
    (token-compatible tok2000 tok_32768_f43764)
    (within-budget price_0_cfcd20 budget100)
    (supports model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e code)
    (can-handle model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e req1)
    (model-available model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e)
    (offered-by model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e prov_deepseek_deepseek_r1_distill_qwen_32b_free__deepseek_004c51)
    (variant-of model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e var_deepseek_deepseek_r1_distill_qwen_32b_free__free_d0394f)
    (provider-supports-variant prov_deepseek_deepseek_r1_distill_qwen_32b_free__deepseek_004c51 var_deepseek_deepseek_r1_distill_qwen_32b_free__free_d0394f)
    (model-supports-variant model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e var_deepseek_deepseek_r1_distill_qwen_32b_free__free_d0394f)
    (max-tokens model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e tok_16000_67510c)
    (price-per-million model_deepseek_deepseek_r1_distill_qwen_32b_free_78ad6e prov_deepseek_deepseek_r1_distill_qwen_32b_free__deepseek_004c51 price_0_cfcd20)
    (token-compatible tok2000 tok_16000_67510c)
    (within-budget price_0_cfcd20 budget100)
    (supports model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 code)
    (can-handle model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 req1)
    (model-available model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5)
    (offered-by model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 prov_deepseek_deepseek_r1_distill_qwen_14b_free__deepseek_a649b7)
    (variant-of model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 var_deepseek_deepseek_r1_distill_qwen_14b_free__free_76051f)
    (provider-supports-variant prov_deepseek_deepseek_r1_distill_qwen_14b_free__deepseek_a649b7 var_deepseek_deepseek_r1_distill_qwen_14b_free__free_76051f)
    (model-supports-variant model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 var_deepseek_deepseek_r1_distill_qwen_14b_free__free_76051f)
    (max-tokens model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 tok_64000_762e98)
    (price-per-million model_deepseek_deepseek_r1_distill_qwen_14b_free_456aa5 prov_deepseek_deepseek_r1_distill_qwen_14b_free__deepseek_a649b7 price_0_cfcd20)
    (token-compatible tok2000 tok_64000_762e98)
    (within-budget price_0_cfcd20 budget100)
    (supports model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d code)
    (can-handle model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d req1)
    (model-available model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d)
    (offered-by model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d prov_deepseek_deepseek_r1_distill_llama_70b_free__deepseek_eeeac2)
    (variant-of model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d var_deepseek_deepseek_r1_distill_llama_70b_free__free_c41c6c)
    (provider-supports-variant prov_deepseek_deepseek_r1_distill_llama_70b_free__deepseek_eeeac2 var_deepseek_deepseek_r1_distill_llama_70b_free__free_c41c6c)
    (model-supports-variant model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d var_deepseek_deepseek_r1_distill_llama_70b_free__free_c41c6c)
    (max-tokens model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d tok_8192_774412)
    (price-per-million model_deepseek_deepseek_r1_distill_llama_70b_free_e4031d prov_deepseek_deepseek_r1_distill_llama_70b_free__deepseek_eeeac2 price_0_cfcd20)
    (token-compatible tok2000 tok_8192_774412)
    (within-budget price_0_cfcd20 budget100)
    (supports model_qwen_qwq_32b_preview_free_b1db62 code)
    (can-handle model_qwen_qwq_32b_preview_free_b1db62 req1)
    (model-available model_qwen_qwq_32b_preview_free_b1db62)
    (offered-by model_qwen_qwq_32b_preview_free_b1db62 prov_qwen_qwq_32b_preview_free__qwen_71dbf3)
    (variant-of model_qwen_qwq_32b_preview_free_b1db62 var_qwen_qwq_32b_preview_free__free_ae3976)
    (provider-supports-variant prov_qwen_qwq_32b_preview_free__qwen_71dbf3 var_qwen_qwq_32b_preview_free__free_ae3976)
    (model-supports-variant model_qwen_qwq_32b_preview_free_b1db62 var_qwen_qwq_32b_preview_free__free_ae3976)
    (max-tokens model_qwen_qwq_32b_preview_free_b1db62 tok_16384_c76fe1)
    (price-per-million model_qwen_qwq_32b_preview_free_b1db62 prov_qwen_qwq_32b_preview_free__qwen_71dbf3 price_0_cfcd20)
    (token-compatible tok2000 tok_16384_c76fe1)
    (within-budget price_0_cfcd20 budget100)
    (supports model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 code)
    (can-handle model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 req1)
    (model-available model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4)
    (offered-by model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 prov_qwen_qwen_2_5_coder_32b_instruct_free__qwen_60565c)
    (variant-of model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 var_qwen_qwen_2_5_coder_32b_instruct_free__free_0633bb)
    (provider-supports-variant prov_qwen_qwen_2_5_coder_32b_instruct_free__qwen_60565c var_qwen_qwen_2_5_coder_32b_instruct_free__free_0633bb)
    (model-supports-variant model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 var_qwen_qwen_2_5_coder_32b_instruct_free__free_0633bb)
    (max-tokens model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 tok_32768_f43764)
    (price-per-million model_qwen_qwen_2_5_coder_32b_instruct_free_ac14e4 prov_qwen_qwen_2_5_coder_32b_instruct_free__qwen_60565c price_0_cfcd20)
    (token-compatible tok2000 tok_32768_f43764)
    (within-budget price_0_cfcd20 budget100)
  )
  (:goal (exists (?m - model) (assigned req1 ?m)))
)