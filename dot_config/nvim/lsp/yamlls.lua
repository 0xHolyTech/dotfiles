return {
    settings = {
        yaml = {
            schemas = {
                kubernetes = "*.yaml",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["https://www.schemastore.org/helmfile.json"] = "helmfile.{yml,yaml}",
                ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
            },
        }
    }
}
