import ballerinax/ai;

final ai:OpenAiProvider openAIAgentModel = check new (openAiApiKey, "gpt-4o");
final ai:SystemPrompt tutorPrompt = {role: "Math Tutor", instructions: string `You are a math tutor assistant who helps students solve math problems. Provide clear, step-by-step instructions to guide them toward the final answer. Be sure to include the final answer at the end. Use the available tools to perform any necessary calculations.`};
final ai:SystemPrompt healthCarePrompt = {role: "Health Care Agent", instructions: "You will help with performing tasks related to healthcare data management."};
final ai:Agent healthCareAgent = check new (
    systemPrompt = healthCarePrompt, model = openAIAgentModel, tools = [fhirMcpToolKit]
);

final ai:McpToolKit fhirMcpToolKit = check new ("http://localhost:8000/mcp", info = {name: "FHIR MCP server", version: "0.1.0"});

