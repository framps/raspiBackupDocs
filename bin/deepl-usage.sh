#!/usr/bin/env bash
# https://developers.deepl.com/api-reference/usage-and-quota/check-usage-and-limits

DEEPL_KEY=$(cat ~/.config/deepl.auth_key)

curl --request GET \
  --url https://api-free.deepl.com/v2/usage \
  --header "Authorization: DeepL-Auth-Key ${DEEPL_KEY}"
