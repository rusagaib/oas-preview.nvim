![image](https://img.shields.io/github/license/rusagaib/oas-preview.nvim)

# oas-preview.nvim
WIP a simple nvim plugin to privew oas/openapis3 or swagger spec currently serve the api-docs using swagger-ui only..

![image](docs/preview.png)

### Prerequisite :sparkles:
---
#### Installing the UI:

**swagger-ui (docker):**

```sh
docker pull swaggerapi/swagger-ui:latest
```
**redoc-ui (docker): currently inprogress** :construction:

```sh
docker pull redocly/redoc
```

**stoplight-ui (unofficial docker): currently inprogress** :construction:

```sh
docker pull skriptfabrik/elements-cli
```

### Install Plugin :rocket:
---

**Lazy.nvim:**

Default:

```
{
    'rusagaib/oas-preview.nvim',
},
```

basic config with auto-setup :sparkles:

```
{
    'rusagaib/oas-preview.nvim',
    config = function()
        require('oas-preview').setup({
            api_route = "http://127.0.0.1", 
            port = "1111",  -- up-to-you 
            ui = "swagger",  -- "swagger", "redoc", "stoplight"
            auto_open_url = false -- false to disable it, default is true 
        })  
    end,
},
```

**Packer:**

add this line on your packer config.lua just add rusagaib/oas-preview.nvim

```
use {'rusagaib/oas-preview.nvim'}
```

**Plug:**

add this line on your config

```
Plug 'rusagaib/oas-preview.nvim'
```


### Apply/setup oas-preview plugin :bow:
---

In your init.lua (Default):

currently avail ui = "swagger", 

inprogress :construction: = "redoc", "stoplight"

```
# with Default config (ui = swagger)
require('oas-preview').setup({})
# OR
require('oas-preview').setup({api_route="http://127.0.0.1", port="2222", ui="stoplight"})
```

### Run :fire:
---

will call another buffer split to bottom, press enter and then it will build container to run container `ui-services` and serve api documentation based from swagger or openapi3 spec (.yaml or .json)

```
:OASPreview
```


### Stop opts :triangular_flag_on_post:
---

will stop buffer commands & delete container services

```
:OASPreviewStop
```

---

#### Any contributions are welcome :beer:

