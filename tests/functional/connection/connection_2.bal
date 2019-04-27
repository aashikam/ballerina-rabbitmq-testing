// Connecting to the broker with incorrect configurations
import ballerina/io;
import ballerina/rabbitmq;

// Creates a ballerina RabbitMQ connection that allows reusability if necessary.
rabbitmq:Connection connection = new({ host: "localhost", port: 61616 });

public function main() {
    // Creates a ballerina RabbitMQ channel.
    rabbitmq:Channel newChannel = new(connection);

    // Declares the queue.
    var queueResult = newChannel->queueDeclare(queueConfig = { queueName: "testQueue" });
    if (queueResult is error) {
        io:println("An error occurred while creating the queue");
    }

    // Publishes the message using the routing key named "testQueue".
    var sendResult = newChannel->basicPublish("Hello from Ballerina", "testQueue");
    if (sendResult is error) {
        io:println("An error occurred while sending the message");
    }
}
