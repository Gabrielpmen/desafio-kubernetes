echo "Criando as imagens .........."


docker build -t gabrielpmen/projeto-backend:1.0 backend/.
docker build -t gabrielpmen/projeto-database:1.0 database/.

echo "Realizando o push das imagens para o Docker Hub .........."


docker push gabrielpmen/projeto-backend:1.0
docker push gabrielpmen/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes .........."

kubectl apply -f ./servoces.yml

echo "Criando os deployments ..........."

kubectl apply -f ./deployments.yml