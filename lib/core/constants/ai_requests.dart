///                                                                             / Quotes
class QuoteRequest {

  static String getEnglish(int minimum, int maximum){
    return "get me a random quote, minimum amount of characters should be $minimum character, "
        "and maximum amount of characters should be $maximum."
        " Start with the quote without any introductions."
        " Do not mention the name of the author, and do not put it into quotation marks,"
        " neither mention the number of characters.";
  }

  static String getGermany(int minimum, int maximum){
    return "Besorgen Sie mir ein zufälliges Zitat."
        " Die Mindestanzahl der Zeichen sollte $minimum Zeichen und die Höchstanzahl der Zeichen $maximum betragen."
        " Beginnen Sie mit dem Zitat ohne Einleitung."
        " Erwähnen Sie nicht den Namen des Autors,"
        " setzen Sie ihn nicht in Anführungszeichen und erwähnen Sie auch nicht die Anzahl der Zeichen.";
  }

  static String getFrench(int minimum, int maximum){
    return "obtenez-moi une citation aléatoire,"
        " le nombre minimum de caractères doit être de $minimum caractères et le nombre maximum de caractères doit être de $maximum."
        " Commencez par la citation sans aucune introduction. Ne mentionnez pas le nom de l'auteur,"
        " ne le mettez pas entre guillemets et ne mentionnez pas non plus le nombre de caractères.";
  }

  static String getItalian(int minimum, int maximum){
    return "procurami una citazione casuale,"
        " il numero minimo di caratteri dovrebbe essere di $minimum caratteri e il numero massimo di caratteri dovrebbe essere $maximum."
        " Inizia con la citazione senza introduzioni."
        " Non menzionare il nome dell'autore, non metterlo tra virgolette, né menzionare il numero di caratteri.";
  }

  static String getChinese(int minimum, int maximum){
    return "给我一个随机报价，最小字符数应为 $minimum 个字符，最大字符数应为 $maximum。"
        "从报价开始，无需任何介绍。"
        " 不要提及作者姓名，不要将其放在引号中，也不要提及字符数。";
  }

}




///                                                                             / Critical Thinking

class CriticalThinkingRequest {

  static const String english = "Ask me a question that requires critical thinking,"
      " make the question short and direct. Start by asking the question with no introductions.";

  static const String germany = "Stellen Sie mir eine Frage, die kritisches Denken erfordert."
      " Formulieren Sie die Frage kurz und direkt. Beginnen Sie damit, die Frage ohne Einleitung zu stellen.";

  static const String frensh = "Posez-moi une question qui nécessite une réflexion critique,"
      " soyez courte et directe. Commencez par poser la question sans introduction.";

  static const String italian = "Fammi una domanda che richieda un pensiero critico,"
      " rendi la domanda breve e diretta. Inizia ponendo la domanda senza presentazioni.";

  static const String chinese = "问我一个需要批判性思维的问题，让问题简短而直接。 首先提出问题，无需介绍。";

}

class GrammarEvaluationRequest {

  static const String english =
  '''
  You will be provided with statements, and your task is to convert them to standard English.
  
  Give me feedback of what you changed.
  
  And also provide a grammar score out of 10 for the user input. 
  ''';

  static const String germany =
  '''
  Sie erhalten Erklärungen und Ihre Aufgabe besteht darin, diese in Standardenglisch umzuwandeln.
  
  Geben Sie mir Feedback zu dem, was Sie geändert haben.
  
  Geben Sie außerdem eine Grammatikbewertung von 10 für die Benutzereingabe an.
  ''';

  static const String frensh =
  '''
  Des déclarations vous seront fournies et votre tâche consiste à les convertir en anglais standard.
  
  Donnez-moi votre avis sur ce que vous avez modifié.
  
  Et fournissez également une note de grammaire sur 10 pour la saisie de l’utilisateur.
  ''';

  static const String italian =
  '''
  Ti verranno fornite delle dichiarazioni e il tuo compito è convertirle nell'inglese standard.
  
  Dammi un feedback su cosa hai cambiato.
  
  Fornisci anche un punteggio grammaticale su 10 per l'input dell'utente.
  ''';

  static const String chinese =
  '''
  您将收到陈述，您的任务是将其转换为标准英语。
  
  向我反馈您所做的更改。
  
  并且还为用户输入提供语法分数（满分 10 分）。
  ''';

}




///                                                                             / Chat

class ChatOpener{
  static const String english =   '''
    I want short answers throughout the conversation.
  
    I will give you some instructions and you will follow:
    1- Ask me a question about anything.
    2- when I answer go with the flow and keep asking me question based on what I said.
    3- reply to this message with your question directly
    4- reply with 2-3 lines maximum
    
    First say Let's get started, 
    and then start with a question about anything interesting to talk about.
    ''';


  static const String germany = "Ich möchte während des gesamten Gesprächs kurze Antworten."
      " Ich gebe Ihnen einige Anweisungen und Sie werden Folgendes befolgen:"
      " 1- Stellen Sie mir zu irgendetwas eine Frage."
      " 2- Wenn ich antworte, geh mit dem Strom und stelle mir weiterhin Fragen basierend auf dem, was ich gesagt habe."
      " 3- Antworten Sie direkt auf diese Nachricht mit Ihrer Frage"
      " 4- Antworten Sie mit maximal 2-3 Zeilen. Beginnen Sie mit einer Frage zu etwas Interessantem, worüber Sie sprechen möchten";

  static const String frensh = "Je veux des réponses courtes tout au long de la conversation."
      " Je vais vous donner quelques instructions et vous suivrez:"
      " 1- Posez-moi une question sur n'importe quoi."
      " 2- quand je réponds, suivez le courant et continuez à me poser des questions en fonction de ce que j'ai dit."
      " 3- répondez directement à ce message avec votre question"
      " 4- répondez en 2-3 lignes maximum. Commencez par une question sur tout ce dont il est intéressant de parler";

  static const String italian = "Voglio risposte brevi durante la conversazione."
      " Ti darò alcune istruzioni e tu seguirai:"
      " 1- Fammi una domanda su qualsiasi cosa."
      " 2- quando rispondo segui il flusso e continua a farmi domande in base a ciò che ho detto."
      " 3- rispondi direttamente a questo messaggio con la tua domanda"
      " 4- rispondi con 2-3 righe al massimo Inizia con una domanda su qualsiasi cosa interessante di cui parlare";

  static const String chinese = "我希望在整个谈话过程中得到简短的回答。"
      " 我会给您一些指示，您将遵循："
      " 1-向我询问有关任何事情的问题。 2-当我回答时，顺其自然，根据我所说的继续问我问题。"
      " 3- 直接回复此消息并提出您的问题 4- 最多回复 2-3 行 从一个关于任何有趣的话题的问题开始";
}