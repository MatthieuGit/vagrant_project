# Vagrant project to build Spring PetClinic Sample application from Postgres Database
## For more information about Spring PetClinic Sample Application 

<a href="https://github.com/spring-projects/spring-petclinic">See the presentation here</a>

## Running vagrant project locally
3 ways are available to run vagrant box.
You can run it from the command line :
```
vagrant init mattVagrant/ubuntu_pet_clinic \
  --box-version 1.0
  vagrant up

``` 
From a vagrant file (after run it the command line vagrant init -m).
add following lines
```
Vagrant.configure("2") do |config|
  config.vm.box = "mattVagrant/ubuntu_pet_clinic"
    config.vm.box_version = "1.0"
    end
```
Or from this repo git (after a git clone or download)
```
vagrant up 
 ```
You can then access petclinic here: http://10.0.0.10:8080/

