# Towing tank #

A docker configuration for exposing selenium web driver to run tests in browsers.

## Installation ##
Run in your terminal:
```bash
git clone git@github.com:osule/towing-tank.git
```

## Web browsers supported ##
The latest version for the following web browsers are supported.
- chromium
- firefox

### Configuring browsers ###
In `browsers.yaml`, write:
```yaml
browser_name:
   version: <version_number>
   binary_url: https://binary_url
```

## Contributing ##
See [CONTRIBUTING.md](CONTRIBUTING.md)
