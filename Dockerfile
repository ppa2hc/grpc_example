FROM python:3.9-slim

WORKDIR /usr/src/app

# Install grpcio-tools for protoc plugin
RUN pip install --no-cache-dir grpcio grpcio-tools

# Copy proto file and Python source files
COPY helloworld.proto ./
COPY client.py server.py ./

# Generate Python gRPC code from proto
RUN python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. helloworld.proto

# Default command (can be overridden)
CMD ["python", "server.py"]
