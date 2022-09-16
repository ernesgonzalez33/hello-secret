# hello-secret
Hello world app for demo about Sealed Secrets

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

## How to install Sealed Secrets in OpenShift

First of all, add the Sealed Secrets repo:

```
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
```

Install it by using the values file in this repo:

```
helm install sealed-secrets -f sealed-secrets/values.yaml sealed-secrets/sealed-secrets
```