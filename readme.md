# Vagrant project to build Spring PetClinic Sample application from Postgres Database
## For more information about Spring PetClinic Sample Application 

<a href="https://github.com/spring-projects/spring-petclinic">See the presentation here</a>

## Running vagrant project locally
First at all you have to get from [Vagrant Cloud] (https://app.vagrantup.com/mattVagrant/boxes/ubuntu_pet_clinic/versions/1.0) the vagrant boxes.
Then 3 ways are available to run vagrant boxex
You can run it from the command line :
```
vagrant init mattVagrant/ubuntu_pet_clinic \
  --box-version 1.0
  vagrant up

``` 
Or from a vagrant File add following lines
```
Vagrant.configure("2") do |config|
  config.vm.box = "mattVagrant/ubuntu_pet_clinic"
    config.vm.box_version = "1.0"
    end
```
Or from this repo git (after a git clone or download)
```
vagrant init
 ```

