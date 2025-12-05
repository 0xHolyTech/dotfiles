require('kubernetes').setup()

return {
    redhat = {
        telemetry = {
            enabled = false,
        },
    },
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
            },
            schemas = {
                [require('kubernetes').yamlls_schema()] = "[!docker*]*.{yaml,yml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["https://www.schemastore.org/helmfile.json"] = "helmfile.{yml,yaml}",
                ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
            },
        }
    }
}
