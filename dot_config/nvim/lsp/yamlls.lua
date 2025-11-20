return {
    settings = {
        yaml = {
            schemas = {
                ["http://json.schemastore.org/kustomization"] = "{kustomization,kustomize}.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
            },
        }
    }
}
