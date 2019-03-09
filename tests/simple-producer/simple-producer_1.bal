import ballerina/io;
import ballerina/rabbitmq;

public function main() {
    rabbitmq:Connection conn = new({host:"localhost", port:5672});
    conn.close(closeCode = 1);

}
