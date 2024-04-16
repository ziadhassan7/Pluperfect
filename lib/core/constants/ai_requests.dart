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

  static const String english = "Ask me any random question,"
      " make the question short and direct. Start by asking the question with no introductions.";

  static const String germany = "Stellen Sie mir eine Frage im Vorstellungsgespräch auf Englisch."
      " Formulieren Sie die Frage kurz und direkt. Beginnen Sie damit, die Frage ohne Einleitung zu stellen.";

  static const String frensh = "Posez-moi une question d'entretien en anglais,"
      " soyez courte et directe. Commencez par poser la question sans introduction.";

  static const String italian = "Fammi una domanda per un'intervista in inglese,"
      " rendi la domanda breve e diretta. Inizia ponendo la domanda senza presentazioni.";

  static const String chinese = "问我一个英语面试问题，问题要简短直接。 首先提出问题，无需介绍。";

}

class GrammarEvaluationRequest {

  static const String english =
  '''
  You will be provided with statements, and your task is to convert them to standard English.
  
  And also provide a grammar score out of 10 for the user input. 
  ''';

  static const String germany =
  '''
  Sie erhalten Erklärungen und Ihre Aufgabe besteht darin, diese in Standardenglisch umzuwandeln.
    
  Geben Sie außerdem eine Grammatikbewertung von 10 für die Benutzereingabe an.
  ''';

  static const String frensh =
  '''
  Des déclarations vous seront fournies et votre tâche consiste à les convertir en anglais standard.
    
  Et fournissez également une note de grammaire sur 10 pour la saisie de l’utilisateur.
  ''';

  static const String italian =
  '''
  Ti verranno fornite delle dichiarazioni e il tuo compito è convertirle nell'inglese standard.
    
  Fornisci anche un punteggio grammaticale su 10 per l'input dell'utente.
  ''';

  static const String chinese =
  '''
  您将收到陈述，您的任务是将其转换为标准英语。
    
  并且还为用户输入提供语法分数（满分 10 分）。
  ''';

}




///                                                                             / Chat

class ChatOpener{
  static const String english =   '''
    First say Let's get started, 
    and then ask me a question (about free time, family, friendships, interests, movies, money, love interests, food, country, dreams, or anything),
    and make your replies short
    ''';

  static const String germany = '''
  Sagen Sie zuerst, fangen wir an,
  und mir dann eine Frage stellen (über Filme, Freizeit, Familie, Geld, Liebe, Essen, Land, Träume oder irgendetwas anderes)
  ''';

  static const String frensh = '''
  Dites d'abord, commençons,
  puis posez-moi une question (sur les films, le temps libre, la famille, l'argent, l'amour, la nourriture, le pays, les rêves ou quoi que ce soit)
  ''';

  static const String italian = '''
  Per prima cosa dici, cominciamo
  e poi fammi una domanda (su film, tempo libero, famiglia, soldi, amore, cibo, paese, sogni o qualsiasi altra cosa)
  ''';

  static const String chinese = '''
  首先说，让我们开始吧，
  然后问我一个问题（关于电影、空闲时间、家庭、金钱、爱情、食物、国家、梦想或任何东西）
  ''';
}