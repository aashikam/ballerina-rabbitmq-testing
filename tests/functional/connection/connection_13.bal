// Sharing a connection
import ballerina/io;
import ballerina/rabbitmq;

// Creates a ballerina RabbitMQ connection that allows reusability if necessary.
rabbitmq:Connection connection = new({ host: "localhost", port: 5672 });

public function main() {
    // Creates a ballerina RabbitMQ channel.
    rabbitmq:Channel newChannel = new(connection);
    rabbitmq:Channel newChannel2 = new(connection);

    // Declares the queue.
    var queueResult = newChannel->queueDeclare(queueConfig = { queueName: "testQueue1" });
    if (queueResult is error) {
        io:println("An error occurred while creating the queue");
    }

    // Publishes the message using the routing key named "testQueue".
    var sendResult = newChannel->basicPublish("Hello from Ballerina", "testQueue1");
    if (sendResult is error) {
        io:println("An error occurred while sending the message");
    }

    // Publishes the message using the routing key named "testQueue".
    var sendResult2 = newChannel2->basicPublish("Hello from Ballerina", "testQueue1");
    if (sendResult is error) {
        io:println("An error occurred while sending the message");
    }
}
