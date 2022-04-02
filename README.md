# ARM Vagrant boxes

Packer template for building Vagrant ARM Ubuntu boxes.

| Distro | Version                                                                     | Provider      |
| ------ |-----------------------------------------------------------------------------|---------------|
| Ubuntu Server | [21.04](https://cdimage.ubuntu.com/releases/21.04/release/) (Hirsute Hippo) | VMWare Fusion|

## Build your box

Just run `./build.sh` (tested on Apple M1). The generated `.box` should be located in the
`output` directory. You can then add the local box as follows:

```
vagrant box add yourhandle/arm-ubuntu2104 /path/to/metadata.json
```

Where `metadata.json` is:
```
{
    "name": "yourhandle/arm-ubuntu2104",
    "versions": [
      {
        "version": "1.0.0",
        "providers": [
          {
            "name": "vmware_fusion",
            "url": "file:///PATH/TO/THE/BOX/vmware-21-04-arm64.box" 
          }
        ]
      }
    ]
  }
```
