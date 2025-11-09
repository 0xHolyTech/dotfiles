function sops_decrypt --wraps='sops --decrypt --age $(cat ~/.ssh/id_age | grep -oP "public key: \K(.*)") --encrypted-regex REGEX --in-place FILE_PATH' --description 'sops_decrypt $FILE_PATH $REGEX'
    sops --decrypt --in-place $argv[1]
end

