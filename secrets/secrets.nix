let
  mcg-valts = {
    root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIGxaUQc7BEZhcmXNcqSHzbKmlmUSLZQ9F4j/ECy4Poy root@mcg-valts";
    valts = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmPt95vTEmI3eT0YALlDN3WWEFdLX1VKUTCbmrKmF7e+1Hy+rN1ln3ELi0kNmj9PEOM4aE7llIDXr8yE3kqMIHJudX1i3kKI9gKySbX8haT8u9MQsC4Nfc2oMz3BKsLvGkrBgCd9PMrTcx7iNC1HNF6RYXO8vP04wncHNRYffMD63t7FUoRkLqSDN9oOpHJ0pXrk1X97413zqcXpW997ASVuJEV6qADkdZXqOpZPPOI0Jav8uAXlsS0qsqwy7srxxeDSDSzUgwoeattLPBfpwQL1zatfTAWkWManvuulxHkybjWs68cnCQbGpUQlX945tTm+YpQtcE2fvtCL+DOigH95iH7hff/YWd72cipuY6VwyyxIMBK5qsPKehENPLb2B6r+jOxd3NedxZMzGYZob48uo1rMcGTJpckTCHFDZ/p3rVIrOIvXazHzXcMoEFvCiQNwiQkALXqvG+9PrSJ86rqu85eUfeGXQErYHpsANma/rw1n9/T3rJ1GRlmxAYZSU= valts@mcg-valts";
  };
  armarium = {
    root = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDopfV6ckxfC4458Kgq8HGP7d6anbwYuH8DMdWJwnK10WakQdGitfk+d8PA9kgZRo/LQmRxe/ij3FyjL6p1OOy5tRIgYHf/rJ72G5TCfI41pOOOjr3yGsTmBjUMDdqgAG2bFHIvKALt5a7Dq4rDPt41B8RXo4v+ZRWUECSs+dIZO6mrS1NXL6XNpv2id5ROz8fY4vE0PguiJJN8C0abPqXddhVhJ1x0XM1ZCzi8Rek5wB1F22T9WHJ7cNlOhz+r7CDTYx9HSFq/o8sNbsa95dfmCNI6CPUfp70rVPT3YwnIsK8kkYTmYFXR1xPUpNTlLqmeEE/69UdK4M5yjfZ35iZYxyUEw9XIN+NnNHxDskqTAgeWiv0p9AEZA11Ty5HQYA1KLZgpoPcrWC4gl+ZfJgt/hBJUflQ3TGLQcBS1tWe4RG0+o31P/wAYGMN6R06SM+l6YF4HdlYyEF12LOhw2JRvRyuwvPYPYDzoIPmXPBselA+WJG7swwBlLV+PAjiqUTILFNrvtCwfTmd7YwUfwKZL1ABCpG086ZfaGP+2XQPzSdk1duy/Md6IY4CrmJZzyHGJDpH22SySoVWmcufZ6WcXWky9Tog5kNxeMbY6M3c0px6wbwW+3om4sBWQkawsBjIGCKO7jG9FYSK5I4+bTvaV8gB6vlcLNoZ2gDLXICHkKw== root@armarium";
  };
  allKeys = [
    mcg-valts.root
    mcg-valts.valts
    armarium.root
  ];
in
{
  "valts.age".publicKeys = allKeys;
  "root.age".publicKeys = allKeys;
}

