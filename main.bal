import ballerina/http;
import ballerinax/ai;

listener ai:Listener healthCareAgentListener = new (listenOn = check http:getDefaultListener());

service /Math_Tutor_Agent on healthCareAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {

        string stringResult = check healthCareAgent->run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
