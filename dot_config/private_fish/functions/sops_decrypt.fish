function sops_decrypt --wraps='sops --decrypt --age $(cat KEY_FILE_PATH | grep -oP "public key: \K(.*)") --encrypted-regex '^(data|stringData)$' --in-place FILE_PATH' --description 'sops_decrypt $AGE_KEY_FILE_PATH $FILE_PATH'
    sops --decrypt --age $(cat $item[1] | grep -oP "public key: \K(.*)") --encrypted-regex '^(data|stringData)$' --in-place $item[2]
end

