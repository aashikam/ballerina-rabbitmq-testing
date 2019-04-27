// Closing an already closed connection
import ballerina/io;
import ballerina/rabbitmq;

// Creates a ballerina RabbitMQ connection that allows reusability if necessary.
rabbitmq:Connection connection = new({ host: "localhost", port: 5672 });

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

    var closeResult = connection.close();
    if (closeResult is error) {
        io:println("Error occurred while closing the connection");
    }

    var close2Result = connection.close();
    if (close2Result is error) {
        io:println("Error occurred while closing the connection again");
    }
}
