# Personal Toolbox images

I've switched my Laptop to Fedora Silverblue so I needed some images for Toolbox in order to have my
development environments ready. I've decided to make my own since I already have some preferences
regarding the base I'm upon which I'll build other images.

In the [images](./images/) directory, you can find the Dockerfiles for all images I made. They are very
opinionated and I don't plan on accepting any feature requests. You are however free to use those
Dockerfiles freely and build upon them to make your own.

## Verify signed images

To verify that images are signed when pulling them, there are some configuration
files that need to be modified. Firstly, add the public key to your machine.

```sh
curl https://raw.githubusercontent.com/dusansimic/toolbox-images/main/cosign.pub | sudo tee /etc/pki/containers/dusansimic-toolbox-images.pub
```

Next, you'll need to add a registry configuration that will allow for checking
that images are signed. Create a file `/etc/containers/registries.d/dusansimic-toolbox-images.yaml`

```yaml
docker:
  ghcr.io/dusansimic/toolbox-images:
    use-sigstore-attachments: true
```

Finally, add the policy for checking signatures to the `/etc/containers/policy.json`.
Be careful to not remove any other configurations in this file!

```json
{
  "transports": {
    "docker": {
      "ghcr.io/dusansimic/toolbox-images": [
        {
          "type": "sigstoreSigned",
          "keyPath": "/etc/pki/containers/dusansimic-toolbox-images.pub",
          "signedIdentity": {
            "type": "matchRepository"
          }
        }
      ]
    }
  }
}
```
