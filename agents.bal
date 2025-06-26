import ballerinax/ai;

final ai:OpenAiProvider openAIAgentModel = check new (openAiApiKey, "gpt-4.1");
final ai:SystemPrompt healthCarePrompt = {role: "Health Care Agent", instructions: "You will help with performing tasks related to healthcare data management."};
final ai:Agent healthCareAgent = check new (
    systemPrompt = healthCarePrompt,
    model = openAIAgentModel,
    tools = [fhirMcpToolKit],
    maxIter = 10
);

final ai:McpToolKit fhirMcpToolKit = check new (fhirMcpUrl, info = {name: "FHIR MCP server", version: "0.1.0"});

