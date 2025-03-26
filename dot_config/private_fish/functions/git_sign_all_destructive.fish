function git_sign_all_destructive --description "GPG sign all previous commits with the correct timestamp (DESTRUCTIVE)"
    git rebase --exec "faketime \$(git show --no-patch --format=%ci HEAD | awk '{print \$1 \" \" \$2}') git commit --amend --no-edit -n -S" -i --root
end
