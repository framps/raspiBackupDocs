#!/usr/bin/env bash
# https://developers.deepl.com/api-reference/usage-and-quota/check-usage-and-limits

DEEPL_KEY=$(cat ~/.config/deepl.auth_key)

RESULT=$(curl --silent --request GET \
  --url https://api-free.deepl.com/v2/usage \
  --header "Authorization: DeepL-Auth-Key ${DEEPL_KEY}" )

if command -pv jq >/dev/null; then
    # jq '.' <(echo "${RESULT}")
    #   {
    #     "character_count": 753,
    #     "character_limit": 500000
    #   }
    CHAR_COUNT=$(jq '.character_count' <(echo "${RESULT}"))
    CHAR_LIMIT=$(jq '.character_limit' <(echo "${RESULT}"))
    PERCENTAGE=$((CHAR_COUNT*100/CHAR_LIMIT))
    echo "You already consumed $CHAR_COUNT characters from your monthly limit of $CHAR_LIMIT characters (${PERCENTAGE}%)."
else
    echo "${RESULT}"
fi

