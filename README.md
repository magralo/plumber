# Plumber example

This repo intends to create and deploy a simple API on google Cloud Run. 


## How to deploy using github actions?

We define a pipeline on .github/worflows/pipe.yml where we specify the steps that runs on an ubuntu machine (You can specify windows or macOS).

3. Authenticate on the google project using a service account's json that is stored as a secret.
4. Build the Dockerfile of the service. (specifying the envioronment)
5. Deploy the service on cloudrun. (specifying the envioronment)

Why use github actions? Free CI/CD

## Endpoints

This API has 2 diferent endpoints :

1. /parity is an example... tell us if the given number is pair or odd. example: https://plumberdev-y5z2fvs4lq-uc.a.run.app/parity?int=19
2. /lovemenot... i build this to tackle a real word problem!! I saw so many daisys died in hands of terrible human beings that killed them just to answer the question: Does my (s)he loves me? Example: https://plumberdev-y5z2fvs4lq-uc.a.run.app/lovemenot