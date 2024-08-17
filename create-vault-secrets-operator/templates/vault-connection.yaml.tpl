apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultConnection
metadata:
  name: vault-connection
  namespace: ${namespace}
spec:
  address: ${vault_address}
  skipTLSVerify: true