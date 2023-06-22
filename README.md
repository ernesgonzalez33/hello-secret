# Hello Secret 

Hello World app for demo about Sealed Secrets. 

## How to run locally

### Set environment variables

The application needs an environment variable called `SECRET` to work. You can create directly in your system by executing:

```bash
export SECRET=<your-secret>
```

or create a .env file with the following content:

```
SECRET=<your-secret>
```

If the variable does not exist, the application will print "Hello World".

### Build and run the application

To build and run the application, you have to run the following commands:

```bash
npm run build

node ./dist/server.js
```

The application will be exposed on port 3000.

## How to run as a container

### Download the image or build it

You can download the app from Quay with the following command:

```bash
podman pull quay.io/ernesgonzalez33/hello-secret
```

or build a new image with the following command in the directory where the `Dockerfile` is located:

```bash
podman build . -t hello-secret 
```

### Run the container

After that, you just need to run it and add the port and env variables:

```bash
podman run \
-p 3000:3000 \
-e SECRET=<your-secret> \
quay.io/ernesgonzalez33/hello-secret
```

> **IMPORTANT:** If you built the image and change its name, you need to change it in the `podman run` command too.

## Deploying in OpenShift

### How to deploy Hello Secret in OpenShift

Since the idea of this app is demonstrate how to encrypt secrets with Sealed Secrets in a `Values` file, you will need to install Sealed Secrets in your OpenShift cluster.

### Install Sealed Secrets in OpenShift

First of all, add the Sealed Secrets repo:

```
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
```

Create the project where you want to install it:

```
oc new-project sealed-secrets
```

Install it by using the values file in this repo:

```
helm install sealed-secrets -f sealed-secrets/values.yaml sealed-secrets/sealed-secrets
```

### Encrypt your secret

First, you will need to install kubeseal on your machine following these instructions:

* [Homebrew](https://github.com/bitnami-labs/sealed-secrets#homebrew)
* [MacPorts](https://github.com/bitnami-labs/sealed-secrets#macports)
* [Nixpkgs](https://github.com/bitnami-labs/sealed-secrets#nixpkgs)
* [Linux](https://github.com/bitnami-labs/sealed-secrets#linux)
* [From Source](https://github.com/bitnami-labs/sealed-secrets#installation-from-source)

Then, run the following command: 

```bash
echo -n <my-secret> | kubeseal --controller-name=sealed-secrets --controller-namespace=sealed-secrets --raw --from-file=/dev/stdin --scope=namespace-wide
```

> **NOTE:** The scope in the command needs to match with the selected in the Values file. For more info: https://github.com/bitnami-labs/sealed-secrets#scopes

The output of that command will be your secret encrypted and you only need to paste it in the values file of the Hello Secret chart.

### Deploy Hello Secret using the Helm Chart

Run the following command:

```bash
helm install hello-secret ./chart/hello-secret/
```
