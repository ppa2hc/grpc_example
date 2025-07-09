# 1. Run natively

## install python lib 
```
pip install grpcio grpcio-tools
```

## Generate python code from interface definition .proto 
```
python3 -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. helloworld.proto
```

## Run server 
```
python3 server.py
```

## Run client 
```
python3 client.py
```

You should see the output:  
```
Greeter client received: Hello, World! 
```

# 2. Run with docker

## build docker image
```
docker build -t grpc-helloworld .
```

## run server
```
docker kill grpc-server; docker rm grpc-server; docker run -d --name grpc-server --network host -p 50051:50051 grpc-helloworld python server.py
```

## run client
```
docker run --rm -it --name grpc-client --network host -p 50051:50051 grpc-helloworld python client.py
```

You should see the output:  
```
developer@rta-vrte-sk:~/dreamSW/grpc_example$ docker run --rm -it --name grpc-client --network host -p 50051:50051 grpc-helloworld python client.py
WARNING: Published ports are discarded when using host network mode
Greeter client received: Hello, World!
```

