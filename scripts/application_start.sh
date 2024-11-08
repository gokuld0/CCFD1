echo "Running container..."
docker run --name flask_app -d -p 5000:5000 public.ecr.aws/u4i0c1o5/car-price-prediction:latest
