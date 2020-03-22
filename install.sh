#!/usr/bin/env bash

read -p "### Init process install (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo "### INFO: UP containers"
        docker-compose up -d
        echo "### INFO: cd web"
        cd web
        echo "### INFO: Install new laravel project"
        docker exec -it php composer create-project --prefer-dist laravel/laravel .
        echo "### INFO: Run yarn install"
        yarn install
        echo "### INFO: Run yarn build"
        yarn build
        echo "### Initialize git"
        git init
        echo "### Run git add -A"
        git add -A
        echo "### Run git commit"
        git commit -m 'initial files'
        echo "### Checkout develop branch"
        git checkout -b develop
        echo "### INFO: Done"
        exit 0;
    ;;
    * )
        echo "### INFO: Exiting!!!"
        exit 0;
    ;;
esac

exit 0;