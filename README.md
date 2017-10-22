# Simplify data-driven processes using the Einstein Analytics Apex SDK

Dreamforce '17 Breakout Session Resources

## Authors, Speakers
- Nils Rosen <nr@qkom.de>
- Dominic Ley <dl@qkom.de>


## Installation via Salesforce DX
git clone https://github.com/aautcsh/df17-implify-analytics
sfdx force:auth:web:login -a df17-simplify-analytics

tbd: build scratch org/convert and deploy metadata



## Resources
- Trailmix: goo.gl/2yH8jo
- Unmanaged Package: tbd

- Einstein Analytics Einstein Apex SDK: goo.gl/KLr2QU
- Einstein Analytics-enabled Developer Edition: goo.gl/q9KWm9 
- Salesforce DX: goo.gl/qB9JH4

## Description of Files and Directories
- pkg/ : Main metadata directory
- aura/AnalyticsUpdateCase : Demo 1 - Lightning Component for Case
- classes/AnalyticsConnector.cls : Apex connector, QueryBuilder, saveCase
- classes/AnalyticsHelper.cls : Helper class which parses executeQuery responses
- classes/AnalyticsContactStatus.cls : Demo 2 - Apex controller


## Disclaimer
The purpose of this is to just provide some basic insights in Einstein Analytics Apex SDK. 
Keep in mind that this is in no way code that should run in production at any time.
