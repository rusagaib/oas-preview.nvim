![image](https://img.shields.io/github/license/rusagaib/oas-preview.nvim)

# oas-preview.nvim
WIP a simple nvim plugin to privew oas/openapis3 or swagger spec currently serve the api-docs using swagger-ui only..

![image](docs/preview.png)

## Installations :rocket:

### 1. Installing the UI :
#### Swagger-ui (docker) 
1. Pull swagger-ui from docker hub:
```
~$ docker pull swaggerapi/swagger-ui:latest
```

### 2. Install Plugin

#### Packer:
add this line on your packer config.lua just add rusagaib/oas-preview.nvim

```
use {'rusagaib/oas-preview.nvim'}
```

#### Plug:
add this line on your config

```
Plug 'rusagaib/oas-preview.nvim'
```


### 3. Apply oas-preview plugin :
In your init.lua (Default):
```
require("oas-preview")
```

### 4. Run :

```
:OASPreview
```

it will call another buffer split to bottom, press enter and then it will build container to run swagger-ui to serve api documentation based from swagger or openapi3 spec (.yaml or .json)

### 5. Stop opts:

```
:OASPreviewStop
```

---

#### Any contributions are welcome :beer:

