# Terraform

Pour permettre terraform de lancer une commande sur la machine distante on utilise ce :

````
provisionner "remote-exec" {
    inline = [
        "les commandes que vous souhaitez executer"
    ]
}
````
Pour se connecter en ssh avec terraform on procède comme suit :
connection {
    type = "ssh"
    user = ""
    private_key = file ("")
    host = self.public.ip
}

Et pour provisionner en local on utilise 

provisionner "local-exec" {
    command = "votre commande"
}