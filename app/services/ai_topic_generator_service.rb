class AiTopicGeneratorService
  def initialize(category)
    @category = category
  end

  def generate_topic
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{
        role: "user",
        content: "Give me an controversial discussion topic under the category of #{@category.title} - #{@category.description}. Give me only the text of the topic, without any of your own answer like 'Here is a simple topic'."
      }]
    })
    chatgpt_response["choices"][0]["message"]["content"]
  end
end
