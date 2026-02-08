![image](https://img.shields.io/github/license/rusagaib/oas-preview.nvim)

# oas-preview.nvim
WIP a simple nvim plugin to preview oas/openapis3 or swagger spec, now includes multiple wrapper container-ui to choose for your preference like swagger, redocly/redoc and stoplight 

![image](docs/preview.png)

### Prerequisite :sparkles:
---
#### Installing the UI:

**swagger-ui (docker):**

```sh
docker pull swaggerapi/swagger-ui:latest
```
**redoc-ui (docker):**

```sh
docker pull redocly/redoc
```

**stoplight-ui (unofficial docker):**

```sh
docker pull skriptfabrik/elements-cli
```

### Install Plugin :rocket:
---

**Lazy.nvim:** *recomended* :hugs:

Default:

```
{
    'rusagaib/oas-preview.nvim',
},
```

basic config with auto-setup  :sparkles:

```
{
    'rusagaib/oas-preview.nvim',
    config = function()
        require('oas-preview').setup({
            port = "1111",        -- up-to-you 
            ui = "swagger",       -- "swagger", "redoc", "stoplight"
            auto_open_url = false -- false to disable it, default is true
            expose = false        -- if it true will serve app container to use local network ip with port 80, default are false
            os = "linux"          -- "linux", "mac", "win", "wsl" if not set will use default "linux"
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

if you're not using Lazy.nvim as plugin manager this section is needed..

In your init.lua (Default nvim config):

```
# with Default config you'll get this conf 
# port = "1111", 
# ui = "swagger", 
# auto_open_url = true, 
# expose = false
# os = "linux"
require('oas-preview').setup({})
```

~ OR ~

```
# choose your preferences ui, disable auto_open_url, disable expose host container-ui etc..
require('oas-preview').setup({
    port="2222",         -- or any port you want 
    ui="stoplight",      -- option ui: swagger, redoc, stoplight 
    auto_open_url=false, -- you can choose true or false
    expose=false         -- default false tho, but if you need to expose it for local network test etc, you can set it to true
    os="mac"             -- "linux", "mac", "win", "wsl" if not set will use default "linux"
})
```

### Run :fire:
---


```
:OASPreview
```


### Stop opts :triangular_flag_on_post:
---

will stop buffer commands & delete container-ui

```
:OASPreviewStop
```


### Check Config :gear: 
---

will print out your set config on oas-preview  

```
:OASPreviewConf
```

### Check Runing Service container-ui :package: 
---

will print out your container-ui info 

```
:OASPreviewCheck
```

---


### Note for wsl users you need install wslview to exec xdg-open browser: 
---

#### [Ubuntu wsl2](https://wslu.wedotstud.io/wslu/install.html#ubuntu) :

```sh
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update
sudo apt install wslu
```

*for any distro wsl you can view other installation guide [here](https://wslu.wedotstud.io/wslu/install.html)

---


#### Any contributions are welcome :beer:

#### Resource:

- [HTTP Status Code (MDN)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status) 
- [OpenApi Spec](https://spec.openapis.org/oas/v3.1.0.html)
- [OpenApi Swagger](https://swagger.io/specification/)
- [OpenApi Examples](https://learn.openapis.org/examples/)

