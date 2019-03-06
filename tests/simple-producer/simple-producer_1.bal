import ballerina/io;
import ballerina/rabbitmq;

public function main() {
    rabbitmq:Connection connection = new({host:"localhost", port:5672});
    //connection.close();
}
