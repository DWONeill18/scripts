#!/bin/bash

#Login to VMOne
ssh admin123@IP(VM1)

#generate key pair
ssh-keygen -t -rsa -b4096 -C "d.w.oneill.18@outlook.com"

#copy public key to VMTwo
ssh-copy-id admin123@IP(VM2)




