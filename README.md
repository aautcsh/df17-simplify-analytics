# Simplify data-driven processes using the Einstein Analytics Apex SDK

Dreamforce '17 Breakout Session Resources

## Authors, Speakers
- Nils Rosen <nr@qkom.de>
- Dominic Ley <dl@qkom.de>


## Installation

You can either choose to install our managed package or to deploy the metadata from the source

### Install Unmanaged package

```
...tbd
```

### Deploy from Source

Clone this repository and authenticate to your Wave-enabled Developer Organization

```
$ git clone https://github.com/aautcsh/df17-simplify-analytics 
$ sfdx force:auth:web:login -a _your_wave_dev_org_alias_
  --> Login to your Wave-enabled Developer Organization and grant access to Salesforce DX
```

Convert the Salesforce DX project sources into Metadata API format

```
$ mkdir mdapiout
$ sfdx force:source:convert --outputdir mdapiout --packagename 'df17-simplify-analytics'
```

Deploy the metadata to your Wave-enabled Developer Organization

```
$ sfdx force:mdapi:deploy --deploydir mdapiout --targetusername _your_wave_dev_org_alias_
```

Open your Organization

```
$ sfdx force:org:open -u _your_wave_dev_org_alias_
```


## Resources
- Trailmix: https://goo.gl/2yH8jo
- Unmanaged Package: tbd

- Einstein Analytics Einstein Apex SDK: https://goo.gl/KLr2QU
- Einstein Analytics-enabled Developer Edition: https://goo.gl/q9KWm9 
- Salesforce DX: https://goo.gl/qB9JH4

## Description of Files and Directories
- pkg/ : Main metadata directory
- aura/AnalyticsUpdateCase : Demo 1 - Lightning Component for Case
- classes/AnalyticsConnector.cls : Apex connector, QueryBuilder, saveCase
- classes/AnalyticsHelper.cls : Helper class which parses executeQuery responses
- classes/AnalyticsContactStatus.cls : Demo 2 - Apex controller


## Disclaimer
The purpose of this is to just provide some basic insights in Einstein Analytics Apex SDK. 
Keep in mind that this is in no way code that should run in production at any time.
