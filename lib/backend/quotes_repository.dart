class Quote {
  final Map<String, String> localizedText;
  final String author;
  const Quote({required this.localizedText, required this.author});
}

const List<Quote> allQuotes = [
  // --- 50 FAMOUS QUOTES ---
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Değişim, rahatlığın bittiği yerde başlar.',
      'en': 'Change begins where comfort ends.',
      'de': 'Veränderung beginnt, wo die Komfortzone endet.',
      'es': 'El cambio comienza donde termina la comodidad.',
      'fr': 'Le changement commence là où finit le confort.',
    },
  ),
  Quote(
    author: 'Sokrates',
    localizedText: {
      'tr': 'Düşmekten korkma, yeniden kalkamamaktan kork.',
      'en': 'Do not fear falling, fear not being able to rise again.',
      'de': 'Fürchte dich nicht vor dem Fallen, sondern davor, nicht wieder aufstehen zu können.',
      'es': 'No temas caer, teme no poder volver a levantarte.',
      'fr': 'Ne crains pas de tomber, crains de ne pas pouvoir te relever.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Zihninin üzerindeki güce sahipsin, dış olayların değil.',
      'en': 'You have power over your mind, not outside events.',
      'de': 'Du hast die Macht über deinen Geist, nicht über äußere Ereignisse.',
      'es': 'Tienes poder sobre tu mente, no sobre los eventos externos.',
      'fr': 'Tu as du pouvoir sur ton esprit, pas sur les événements extérieurs.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Bugün, dünkü kendini yendiğin gündür.',
      'en': 'Today is the day you conquer your yesterday\'s self.',
      'de': 'Heute ist der Tag, an dem du dein gestriges Ich besiegst.',
      'es': 'Hoy es el día en que conquistas a tu yo de ayer.',
      'fr': 'Aujourd\'hui est le jour où tu vaincs ton moi d\'hier.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Zorluk yaşamayan, kendini kanıtlayamaz.',
      'en': 'He who has not experienced difficulty cannot prove himself.',
      'de': 'Wer keine Schwierigkeiten erlebt hat, kann sich nicht beweisen.',
      'es': 'Quien no ha experimentado dificultades no puede probarse a sí mismo.',
      'fr': 'Celui qui n\'a pas connu la difficulté ne peut faire ses preuves.',
    },
  ),
  Quote(
    author: 'Machiavelli',
    localizedText: {
      'tr': 'İrade büyükse, zorluklar büyük kalamaz.',
      'en': 'Where the will is great, the difficulties cannot be great.',
      'de': 'Wo der Wille groß ist, können die Schwierigkeiten nicht groß sein.',
      'es': 'Donde la voluntad es grande, las dificultades no pueden ser grandes.',
      'fr': 'Là où la volonté est grande, les difficultés ne peuvent l\'être.',
    },
  ),
  Quote(
    author: 'Friedrich Nietzsche',
    localizedText: {
      'tr': 'Beni öldürmeyen, beni güçlendirir.',
      'en': 'What does not kill me, makes me stronger.',
      'de': 'Was mich nicht umbringt, macht mich stärker.',
      'es': 'Lo que no me mata, me hace más fuerte.',
      'fr': 'Ce qui ne me tue pas me rend plus fort.',
    },
  ),
  Quote(
    author: 'Sun Tzu',
    localizedText: {
      'tr': 'Kazanmak önce zihninde başlar.',
      'en': 'Winning begins in the mind first.',
      'de': 'Gewinnen beginnt zuerst im Kopf.',
      'es': 'Ganar comienza primero en la mente.',
      'fr': 'Gagner commence d\'abord dans l\'esprit.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'İyi insanı anlatma; iyi biri ol.',
      'en': 'Do not talk about what a good man should be; be one.',
      'de': 'Sprich nicht darüber, was ein guter Mensch sein sollte; sei einer.',
      'es': 'No hables sobre lo que debe ser un buen hombre; sé uno.',
      'fr': 'Ne parle pas de ce que devrait être un homme de bien ; sois-en un.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Hafif acılar konuşur, büyük acılar dilsizdir.',
      'en': 'Light griefs are loquacious, but the great are dumb.',
      'de': 'Leichte Schmerzen sprechen, große Schmerzen sind stumm.',
      'es': 'Los dolores leves hablan, los grandes son mudos.',
      'fr': 'Les petites douleurs sont bavardes, les grandes sont muettes.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Her şeyde kararlılık, hiçbir şeyde tereddüt etmemektir.',
      'en': 'Determination in all things is hesitating in nothing.',
      'de': 'Entschlossenheit in allem bedeutet, in nichts zu zögern.',
      'es': 'Determinación en todas las cosas es no dudar en nada.',
      'fr': 'La détermination en toutes choses est de n\'hésiter en rien.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'İnsanı olaylar değil, düşünceleri sarsar.',
      'en': 'People are not disturbed by things, but by the views they take of things.',
      'de': 'Menschen werden nicht durch die Dinge beunruhigt, sondern durch ihre Sicht auf die Dinge.',
      'es': 'A los hombres no les perturban las cosas, sino la visión que tienen de ellas.',
      'fr': 'Ce qui trouble les hommes, ce ne sont pas les choses, mais les jugements qu\'ils portent sur les choses.',
    },
  ),
  Quote(
    author: 'Buda',
    localizedText: {
      'tr': 'Kendi kendinin efendisi ol.',
      'en': 'Be your own master.',
      'de': 'Sei dein eigener Meister.',
      'es': 'Sé tu propio maestro.',
      'fr': 'Sois ton propre maître.',
    },
  ),
  Quote(
    author: 'Konfüçyüs',
    localizedText: {
      'tr': 'En büyük zafer düşmemekte değil, her düştüğümüzde ayağa kalkmaktadır.',
      'en': 'Our greatest glory is not in never falling, but in rising every time we fall.',
      'de': 'Unser größter Ruhm liegt nicht darin, niemals zu fallen, sondern jedes Mal wieder aufzustehen.',
      'es': 'Nuestra mayor gloria no está en no caer nunca, sino en levantarnos cada vez que caemos.',
      'fr': 'Notre plus grande gloire n\'est pas de ne jamais tomber, mais de nous relever à chaque chute.',
    },
  ),
  Quote(
    author: 'Aristoteles',
    localizedText: {
      'tr': 'Biz neyi tekrar tekrar yapıyorsak oyuz. O halde mükemmellik bir eylem değil, alışkanlıktır.',
      'en': 'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
      'de': 'Wir sind, was wir wiederholt tun. Vorzüglichkeit ist also keine Handlung, sondern eine Gewohnheit.',
      'es': 'Somos lo que hacemos repetidamente. La excelencia, entonces, no es un acto, sino un hábito.',
      'fr': 'Nous sommes ce que nous faisons de manière répétée. L\'excellence n\'est donc pas un acte, mais une habitude.',
    },
  ),
  Quote(
    author: 'Büyük İskender',
    localizedText: {
      'tr': 'Deneyenler için imkansız diye bir şey yoktur.',
      'en': 'There is nothing impossible to him who will try.',
      'de': 'Es gibt nichts Unmögliches für den, der es versucht.',
      'es': 'No hay nada imposible para el que lo intenta.',
      'fr': 'Il n\'y a rien d\'impossible pour celui qui essaie.',
    },
  ),
  Quote(
    author: 'Jül Sezar',
    localizedText: {
      'tr': 'Korkaklar ölümlerinden önce birçok kez ölür, cesurlar ise ölümü bir kez tadar.',
      'en': 'Cowards die many times before their deaths; the valiant never taste of death but once.',
      'de': 'Feiglinge sterben viele Male vor ihrem Tod; die Tapferen schmecken den Tod nur einmal.',
      'es': 'Los cobardes mueren muchas veces antes de su muerte; los valientes nunca prueban la muerte más de una vez.',
      'fr': 'Les lâches meurent plusieurs fois avant leur mort ; les braves ne goûtent à la mort qu\'une seule fois.',
    },
  ),
  Quote(
    author: 'Laozi',
    localizedText: {
      'tr': 'Başkalarına hükmeden güçlüdür, kendine hükmeden ise yenilmez.',
      'en': 'He who controls others may be powerful, but he who has mastered himself is mightier still.',
      'de': 'Wer andere kontrolliert, mag mächtig sein, aber wer sich selbst beherrscht, ist noch mächtiger.',
      'es': 'Quien controla a los demás puede ser poderoso, pero quien se ha dominado a sí mismo es aún más poderoso.',
      'fr': 'Celui qui contrôle les autres peut être puissant, mais celui qui s\'est maîtrisé est encore plus puissant.',
    },
  ),
  Quote(
    author: 'Winston Churchill',
    localizedText: {
      'tr': 'Başarı son değildir, başarısızlık ölümcül değildir; devam etme cesaretidir önemli olan.',
      'en': 'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      'de': 'Erfolg ist nicht endgültig, Misserfolg ist nicht fatal: Was zählt, ist der Mut weiterzumachen.',
      'es': 'El éxito no es final, el fracaso no es fatal: es el coraje de continuar lo que cuenta.',
      'fr': 'Le succès n\'est pas final, l\'échec n\'est pas fatal : c\'est le courage de continuer qui compte.',
    },
  ),
  Quote(
    author: 'Albert Camus',
    localizedText: {
      'tr': 'Kışın en derin vaktinde içimde yenilmez bir yaz olduğunu öğrendim.',
      'en': 'In the depth of winter, I finally learned that within me there lay an invincible summer.',
      'de': 'In der Tiefe des Winters erfuhr ich schließlich, dass in mir ein unbesiegbarer Sommer liegt.',
      'es': 'En las profundidades del invierno finalmente aprendí que en mi interior habitaba un verano invencible.',
      'fr': 'Au milieu de l\'hiver, j\'apprenais enfin qu\'il y avait en moi un été invincible.',
    },
  ),
  Quote(
    author: 'Platon',
    localizedText: {
      'tr': 'İlk ve en büyük zafer kendini fethetmektir.',
      'en': 'The first and greatest victory is to conquer yourself.',
      'de': 'Der erste und größte Sieg ist es, sich selbst zu besiegen.',
      'es': 'La primera y mayor victoria es conquistarse a sí mismo.',
      'fr': 'La première et la plus grande victoire est de se conquérir soi-même.',
    },
  ),
  Quote(
    author: 'Herakleitos',
    localizedText: {
      'tr': 'Büyük sonuçlar, büyük zorluklar gerektirir.',
      'en': 'Big results require big ambitions.',
      'de': 'Große Ergebnisse erfordern große Anstrengungen.',
      'es': 'Los grandes resultados requieren grandes dificultades.',
      'fr': 'Les grands résultats nécessitent de grandes difficultés.',
    },
  ),
  Quote(
    author: 'Dante Alighieri',
    localizedText: {
      'tr': 'En karanlık yerler, kriz anlarında tarafsız kalanlara ayrılmıştır.',
      'en': 'The darkest places in hell are reserved for those who maintain their neutrality in times of moral crisis.',
      'de': 'Die dunkelsten Orte der Hölle sind für diejenigen reserviert, die in Zeiten einer moralischen Krise ihre Neutralität bewahren.',
      'es': 'Los lugares más oscuros del infierno están reservados para aquellos que mantienen su neutralidad en tiempos de crisis moral.',
      'fr': 'Les endroits les plus sombres de l\'enfer sont réservés à ceux qui maintiennent leur neutralité en temps de crise morale.',
    },
  ),
  Quote(
    author: 'Spartalılar',
    localizedText: {
      'tr': 'Daha fazla ter, daha az kan demektir.',
      'en': 'More sweat in peace, less blood in war.',
      'de': 'Mehr Schweiß im Frieden, weniger Blut im Krieg.',
      'es': 'Más sudor en tiempos de paz, menos sangre en la guerra.',
      'fr': 'Plus de sueur en temps de paix, moins de sang à la guerre.',
    },
  ),
  Quote(
    author: 'Leonidas',
    localizedText: {
      'tr': 'Gel de al!',
      'en': 'Come and take them! (Molon Labe)',
      'de': 'Komm und hol sie dir!',
      'es': '¡Ven y tómalas!',
      'fr': 'Viens les prendre !',
    },
  ),
  Quote(
    author: 'Musashi Miyamoto',
    localizedText: {
      'tr': 'Görmek ayrıdır, algılamak ayrı.',
      'en': 'Perception is strong and sight weak.',
      'de': 'Wahrnehmung ist stark, das Sehen schwach.',
      'es': 'La percepción es fuerte, la vista es débil.',
      'fr': 'La perception est forte, la vue est faible.',
    },
  ),
  Quote(
    author: 'Stoacı',
    localizedText: {
      'tr': 'Acı kaçınılmazdır, ıstırap ise tercihtir.',
      'en': 'Pain is inevitable. Suffering is optional.',
      'de': 'Schmerz ist unvermeidlich. Leiden ist freiwillig.',
      'es': 'El dolor es inevitable. El sufrimiento es opcional.',
      'fr': 'La douleur est inévitable. La souffrance est optionnelle.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Yaptığın her eylemi hayattaki son eyleminmiş gibi yap.',
      'en': 'Let every act of your life be done as if it were your last.',
      'de': 'Lass jede deiner Handlungen so sein, als wäre es deine letzte.',
      'es': 'Deja que cada acto de tu vida sea hecho como si fuera el último.',
      'fr': 'Que chaque acte de ta vie soit accompli comme si c\'était le dernier.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Hayat kısa değil, biz onu boşa harcıyoruz.',
      'en': 'Life is not short, but we waste a lot of it.',
      'de': 'Das Leben ist nicht kurz, aber wir verschwenden viel davon.',
      'es': 'La vida no es corta, pero desperdiciamos mucho de ella.',
      'fr': 'La vie n\'est pas courte, mais nous en gaspillons beaucoup.',
    },
  ),
  Quote(
    author: 'Theodore Roosevelt',
    localizedText: {
      'tr': 'Sıkıntı çekmemiş bir adamı kimse takdir etmez.',
      'en': 'Never throughout history has a man who lived a life of ease left a name worth remembering.',
      'de': 'Niemals in der Geschichte hat ein Mann, der ein Leben in Leichtigkeit führte, einen Namen hinterlassen, an den man sich erinnert.',
      'es': 'Nunca en la historia un hombre que vivió una vida de facilidad dejó un nombre digno de recordar.',
      'fr': 'Jamais dans l\'histoire un homme qui a vécu une vie de facilité n\'a laissé un nom digne d\'être rappelé.',
    },
  ),
  Quote(
    author: 'Bruce Lee',
    localizedText: {
      'tr': 'Kolay bir hayat dileme, zor bir hayata dayanacak güç dile.',
      'en': 'Do not pray for an easy life, pray for the strength to endure a difficult one.',
      'de': 'Bete nicht um ein einfaches Leben, bete um die Kraft, ein schweres zu ertragen.',
      'es': 'No ores por una vida fácil, ora por la fuerza para soportar una difícil.',
      'fr': 'Ne prie pas pour une vie facile, prie pour avoir la force d\'endurer une vie difficile.',
    },
  ),
  Quote(
    author: 'Muhammed Ali',
    localizedText: {
      'tr': 'Günleri sayma, günleri kayda değer kıl.',
      'en': 'Don\'t count the days, make the days count.',
      'de': 'Zähle nicht die Tage, sorge dafür, dass die Tage zählen.',
      'es': 'No cuentes los días, haz que los días cuenten.',
      'fr': 'Ne compte pas les jours, fais que les jours comptent.',
    },
  ),
  Quote(
    author: 'Vince Lombardi',
    localizedText: {
      'tr': 'Mükemmellik ulaşılamazdır, ancak mükemmelliği kovalarken yakalayabileceğimiz şey başarıdır.',
      'en': 'Perfection is not attainable, but if we chase perfection we can catch excellence.',
      'de': 'Perfektion ist nicht erreichbar, aber wenn wir der Perfektion nachjagen, können wir Exzellenz fangen.',
      'es': 'La perfección no es alcanzable, pero si perseguimos la perfección podemos atrapar la excelencia.',
      'fr': 'La perfection n\'est pas atteignable, mais si nous poursuivons la perfection, nous pouvons atteindre l\'excellence.',
    },
  ),
  Quote(
    author: 'Michael Jordan',
    localizedText: {
      'tr': 'Defalarca başarısız oldum. Ve işte bu yüzden başardım.',
      'en': 'I\'ve failed over and over and over again in my life. And that is why I succeed.',
      'de': 'Ich habe in meinem Leben immer und immer wieder versagt. Und genau deshalb bin ich erfolgreich.',
      'es': 'He fallado una y otra y otra vez en mi vida. Y es por eso que tengo éxito.',
      'fr': 'J\'ai échoué encore et encore et encore dans ma vie. Et c\'est pourquoi je réussis.',
    },
  ),
  Quote(
    author: 'Cengiz Han',
    localizedText: {
      'tr': 'Eylemin değeri, sonuna kadar götürülmesindedir.',
      'en': 'The merit in action lies in finishing it to the end.',
      'de': 'Der Wert des Handelns liegt darin, es bis zum Ende zu führen.',
      'es': 'El mérito en la acción radica en terminarla hasta el final.',
      'fr': 'Le mérite de l\'action réside dans son achèvement jusqu\'au bout.',
    },
  ),
  Quote(
    author: 'Rumi',
    localizedText: {
      'tr': 'Yara, ışığın içine sızdığı yerdir.',
      'en': 'The wound is the place where the Light enters you.',
      'de': 'Die Wunde ist der Ort, an dem das Licht in dich eindringt.',
      'es': 'La herida es el lugar por donde la Luz entra en ti.',
      'fr': 'La blessure est l\'endroit où la Lumière entre en toi.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Herkes kendi karakterinin zindanıdır.',
      'en': 'It is impossible for a man to learn what he thinks he already knows.',
      'de': 'Es ist unmöglich für einen Menschen, das zu lernen, was er bereits zu wissen glaubt.',
      'es': 'Es imposible que un hombre aprenda lo que cree que ya sabe.',
      'fr': 'Il est impossible pour un homme d\'apprendre ce qu\'il pense déjà savoir.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'En iyi intikam, düşmanına benzememektir.',
      'en': 'The best revenge is to be unlike him who performed the injury.',
      'de': 'Die beste Rache ist es, demjenigen nicht zu gleichen, der die Verletzung begangen hat.',
      'es': 'La mejor venganza es ser diferente a quien causó el daño.',
      'fr': 'La meilleure vengeance est de ne pas ressembler à celui qui a causé le tort.',
    },
  ),
  Quote(
    author: 'Aristoteles',
    localizedText: {
      'tr': 'Sabır acıdır, ama meyvesi tatlıdır.',
      'en': 'Patience is bitter, but its fruit is sweet.',
      'de': 'Geduld ist bitter, aber ihre Frucht ist süß.',
      'es': 'La paciencia es amarga, pero su fruto es dulce.',
      'fr': 'La patience est amère, mais son fruit est doux.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Bazen yaşamak bile cesaret eylemidir.',
      'en': 'Sometimes even to live is an act of courage.',
      'de': 'Manchmal ist selbst das Leben ein Akt des Mutes.',
      'es': 'A veces incluso vivir es un acto de valentía.',
      'fr': 'Parfois, même vivre est un acte de courage.',
    },
  ),
  Quote(
    author: 'Sokrates',
    localizedText: {
      'tr': 'Kendini bulmak istiyorsan, kendin için düşün.',
      'en': 'To find yourself, think for yourself.',
      'de': 'Um dich selbst zu finden, denke für dich selbst.',
      'es': 'Para encontrarte a ti mismo, piensa por ti mismo.',
      'fr': 'Pour te trouver, pense par toi-même.',
    },
  ),
  Quote(
    author: 'Viktor Frankl',
    localizedText: {
      'tr': 'Etki ile tepki arasında bir boşluk vardır. O boşlukta tepkimizi seçme özgürlüğümüz yatar.',
      'en': 'Between stimulus and response there is a space. In that space is our power to choose our response.',
      'de': 'Zwischen Reiz und Reaktion liegt ein Raum. In diesem Raum liegt unsere Macht, unsere Reaktion zu wählen.',
      'es': 'Entre el estímulo y la respuesta hay un espacio. En ese espacio reside nuestro poder para elegir nuestra respuesta.',
      'fr': 'Entre le stimulus et la réponse, il y a un espace. Dans cet espace réside notre pouvoir de choisir notre réponse.',
    },
  ),
  Quote(
    author: 'Carl Jung',
    localizedText: {
      'tr': 'Ben bana olana değil, olmayı seçtiğim kişiye dönüşürüm.',
      'en': 'I am not what happened to me, I am what I choose to become.',
      'de': 'Ich bin nicht das, was mir passiert ist, ich bin das, was ich wähle zu werden.',
      'es': 'No soy lo que me pasó, soy lo que elijo llegar a ser.',
      'fr': 'Je ne suis pas ce qui m\'est arrivé, je suis ce que je choisis de devenir.',
    },
  ),
  Quote(
    author: 'Albert Einstein',
    localizedText: {
      'tr': 'Zorlukların tam ortasında fırsat yatar.',
      'en': 'In the middle of difficulty lies opportunity.',
      'de': 'Inmitten der Schwierigkeit liegt die Gelegenheit.',
      'es': 'En medio de la dificultad reside la oportunidad.',
      'fr': 'Au milieu de la difficulté se trouve l\'opportunité.',
    },
  ),
  Quote(
    author: 'Jocko Willink',
    localizedText: {
      'tr': 'Disiplin, özgürlüğe eşittir.',
      'en': 'Discipline equals freedom.',
      'de': 'Disziplin bedeutet Freiheit.',
      'es': 'Disciplina es igual a libertad.',
      'fr': 'La discipline équivaut à la liberté.',
    },
  ),
  Quote(
    author: 'David Goggins',
    localizedText: {
      'tr': 'Zihninin %40\'ına ulaştığında, daha yeni başlıyorsun.',
      'en': 'When your mind is telling you you\'re done, you\'re really only 40 percent done.',
      'de': 'Wenn dein Verstand dir sagt, du bist am Ende, hast du erst 40 Prozent erreicht.',
      'es': 'Cuando tu mente te dice que has terminado, en realidad solo has completado el 40 por ciento.',
      'fr': 'Quand ton esprit te dit que tu as fini, tu n\'es en réalité qu\'à 40 pour cent.',
    },
  ),
  Quote(
    author: 'Henry Ford',
    localizedText: {
      'tr': 'Yapabileceğini düşünüyorsan da, yapamayacağını düşünüyorsan da haklısın.',
      'en': 'Whether you think you can, or you think you can\'t – you\'re right.',
      'de': 'Ob du denkst, du kannst es, oder du denkst, du kannst es nicht – du hast recht.',
      'es': 'Tanto si crees que puedes, como si crees que no puedes, tienes razón.',
      'fr': 'Que tu penses pouvoir ou ne pas pouvoir, tu as raison.',
    },
  ),
  Quote(
    author: 'Thomas Edison',
    localizedText: {
      'tr': 'Başarısız olmadım. Sadece işe yaramayan 10.000 yol buldum.',
      'en': 'I have not failed. I\'ve just found 10,000 ways that won\'t work.',
      'de': 'Ich habe nicht versagt. Ich habe nur 10.000 Wege gefunden, die nicht funktionieren.',
      'es': 'No he fracasado. Solo he encontrado 10.000 formas que no funcionan.',
      'fr': 'Je n\'ai pas échoué. J\'ai juste trouvé 10 000 façons qui ne fonctionnent pas.',
    },
  ),
  Quote(
    author: 'Helen Keller',
    localizedText: {
      'tr': 'Karakter kolaylık ve sessizlik içinde geliştirilemez.',
      'en': 'Character cannot be developed in ease and quiet.',
      'de': 'Charakter kann nicht in Leichtigkeit und Ruhe entwickelt werden.',
      'es': 'El carácter no se puede desarrollar con facilidad y tranquilidad.',
      'fr': 'Le caractère ne peut être développé dans la facilité et la tranquillité.',
    },
  ),
  Quote(
    author: 'Abraham Lincoln',
    localizedText: {
      'tr': 'Geleceği tahmin etmenin en iyi yolu, onu yaratmaktır.',
      'en': 'The best way to predict your future is to create it.',
      'de': 'Der beste Weg, die Zukunft vorauszusagen, ist, sie zu erschaffen.',
      'es': 'La mejor manera de predecir tu futuro es crearlo.',
      'fr': 'La meilleure façon de prédire ton avenir est de le créer.',
    },
  ),

  // --- 30 ORIGINAL PAINTOGAIN QUOTES ---
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugünkü savaşın, yarının karakterini kurar.',
      'en': 'Your fight today builds your character tomorrow.',
      'de': 'Dein heutiger Kampf formt deinen morgigen Charakter.',
      'es': 'Tu lucha de hoy forja tu carácter de mañana.',
      'fr': 'Ton combat d\'aujourd\'hui forge ton caractère de demain.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Güç, devam etmeyi seçtiğin anda başlar.',
      'en': 'Strength begins the moment you choose to keep going.',
      'de': 'Stärke beginnt in dem Moment, in dem du dich entscheidest, weiterzumachen.',
      'es': 'La fuerza comienza en el momento en que decides seguir adelante.',
      'fr': 'La force commence au moment où tu choisis de continuer.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bahaneler seni korur, disiplin seni değiştirir.',
      'en': 'Excuses protect you, discipline changes you.',
      'de': 'Ausreden schützen dich, Disziplin verändert dich.',
      'es': 'Las excusas te protegen, la disciplina te cambia.',
      'fr': 'Les excuses te protègent, la discipline te change.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Kendini yenmeden hayatını değiştiremezsin.',
      'en': 'You cannot change your life without conquering yourself.',
      'de': 'Du kannst dein Leben nicht verändern, ohne dich selbst zu besiegen.',
      'es': 'No puedes cambiar tu vida sin conquistarte a ti mismo.',
      'fr': 'Tu ne peux pas changer ta vie sans te conquérir toi-même.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugün kaçtığın şey, yarın yine karşına çıkar.',
      'en': 'What you run away from today will confront you again tomorrow.',
      'de': 'Wovor du heute wegläufst, wird dich morgen wieder konfrontieren.',
      'es': 'Lo que huyes hoy te enfrentará de nuevo mañana.',
      'fr': 'Ce que tu fuis aujourd\'hui te confrontera à nouveau demain.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Eski sen direnecek, yeni sen kazanacak.',
      'en': 'The old you will resist, the new you will win.',
      'de': 'Dein altes Ich wird sich wehren, dein neues Ich wird gewinnen.',
      'es': 'Tu viejo yo resistirá, tu nuevo yo ganará.',
      'fr': 'L\'ancien toi résistera, le nouveau toi gagnera.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Beklediğin kişi, verdiğin kararlarda saklı.',
      'en': 'The person you wait for is hidden in the decisions you make.',
      'de': 'Die Person, auf die du wartest, ist in deinen Entscheidungen verborgen.',
      'es': 'La persona que esperas está escondida en las decisiones que tomas.',
      'fr': 'La personne que tu attends est cachée dans les décisions que tu prends.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zorlanıyorsan, doğru yolda ilerliyorsun.',
      'en': 'If you are struggling, you are moving in the right direction.',
      'de': 'Wenn du kämpfst, gehst du in die richtige Richtung.',
      'es': 'Si estás luchando, te estás moviendo en la dirección correcta.',
      'fr': 'Si tu luttes, tu vas dans la bonne direction.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugün dayan, yarın hükmet.',
      'en': 'Endure today, rule tomorrow.',
      'de': 'Heute ertragen, morgen herrschen.',
      'es': 'Aguanta hoy, gobierna mañana.',
      'fr': 'Endure aujourd\'hui, règne demain.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'İstek geçer, ettiğin yemin kalır.',
      'en': 'Desire passes, the oath you took remains.',
      'de': 'Das Verlangen vergeht, der geleistete Eid bleibt.',
      'es': 'El deseo pasa, el juramento que tomaste permanece.',
      'fr': 'Le désir passe, le serment que tu as fait demeure.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Acı geçicidir, zafer ise sonsuz.',
      'en': 'Pain is temporary, victory is eternal.',
      'de': 'Schmerz ist vorübergehend, der Sieg ist ewig.',
      'es': 'El dolor es temporal, la victoria es eterna.',
      'fr': 'La douleur est temporaire, la victoire est éternelle.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Gerçek savaşçı, zayıflıklarıyla savaşandır.',
      'en': 'A true warrior fights his own weaknesses.',
      'de': 'Ein wahrer Krieger kämpft mit seinen Schwächen.',
      'es': 'Un verdadero guerrero lucha contra sus debilidades.',
      'fr': 'Un vrai guerrier combat ses propres faiblesses.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'En karanlık gece bile şafağa teslim olur.',
      'en': 'Even the darkest night yields to dawn.',
      'de': 'Sogar die dunkelste Nacht weicht der Morgendämmerung.',
      'es': 'Incluso la noche más oscura cede al amanecer.',
      'fr': 'Même la nuit la plus sombre cède à l\'aube.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Yüzleşmediğin korkuların sınırlarını belirler.',
      'en': 'The fears you don\'t face set your limits.',
      'de': 'Die Ängste, denen du dich nicht stellst, setzen deine Grenzen.',
      'es': 'Los miedos que no enfrentas establecen tus límites.',
      'fr': 'Les peurs que tu n\'affrontes pas fixent tes limites.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Sadece vazgeçtiğinde kaybedersin.',
      'en': 'You only lose when you give up.',
      'de': 'Du verlierst nur, wenn du aufgibst.',
      'es': 'Solo pierdes cuando te rindes.',
      'fr': 'Tu ne perds que lorsque tu abandonnes.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugünün teri, yarının zaferidir.',
      'en': 'Today\'s sweat is tomorrow\'s victory.',
      'de': 'Der heutige Schweiß ist der morgige Sieg.',
      'es': 'El sudor de hoy es la victoria de mañana.',
      'fr': 'La sueur d\'aujourd\'hui est la victoire de demain.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'İhanet affedilir, kendine ihanet asla.',
      'en': 'Betrayal is forgiven, but never betraying yourself.',
      'de': 'Verrat wird vergeben, aber niemals sich selbst zu verraten.',
      'es': 'La traición se perdona, pero traicionarse a sí mismo nunca.',
      'fr': 'La trahison est pardonnée, mais jamais la trahison de soi-même.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zorlu yollar, güçlü insanları yaratır.',
      'en': 'Hard paths create strong people.',
      'de': 'Harte Wege erschaffen starke Menschen.',
      'es': 'Caminos difíciles crean personas fuertes.',
      'fr': 'Les chemins difficiles créent des personnes fortes.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Hedefine sadık ol, mazeretlere değil.',
      'en': 'Be loyal to your goal, not to excuses.',
      'de': 'Sei deinem Ziel treu, nicht deinen Ausreden.',
      'es': 'Sé leal a tu objetivo, no a tus excusas.',
      'fr': 'Sois fidèle à ton objectif, pas à tes excuses.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Seni durduran gücün değil, kararsızlığın.',
      'en': 'What stops you is not your strength, but your indecision.',
      'de': 'Was dich aufhält, ist nicht deine Kraft, sondern deine Unentschlossenheit.',
      'es': 'Lo que te detiene no es tu fuerza, sino tu indecisión.',
      'fr': 'Ce qui t\'arrête n\'est pas ta force, mais ton indécision.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Aynadakiyle barışırsan, dünya sana savaş açamaz.',
      'en': 'Make peace with the mirror, and the world cannot wage war on you.',
      'de': 'Schließe Frieden mit dem Spiegel, und die Welt kann keinen Krieg gegen dich führen.',
      'es': 'Haz las paces con el espejo, y el mundo no podrá declararte la guerra.',
      'fr': 'Fais la paix avec le miroir, et le monde ne pourra pas te déclarer la guerre.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Düşüşün şiddeti, kalkışının haşmetini belirler.',
      'en': 'The severity of your fall determines the majesty of your rise.',
      'de': 'Die Schwere deines Falls bestimmt die Majestät deines Aufstiegs.',
      'es': 'La gravedad de tu caída determina la majestuosidad de tu ascenso.',
      'fr': 'La sévérité de ta chute détermine la majesté de ton ascension.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Demir ateşte, insan acıda dövülür.',
      'en': 'Iron is forged in fire, man in pain.',
      'de': 'Eisen wird im Feuer geschmiedet, der Mensch im Schmerz.',
      'es': 'El hierro se forja en el fuego, el hombre en el dolor.',
      'fr': 'Le fer est forgé dans le feu, l\'homme dans la douleur.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Pes etmek, hiç başlamamış olmaktan daha kötüdür.',
      'en': 'Giving up is worse than never having started.',
      'de': 'Aufgeben ist schlimmer als gar nicht erst anzufangen.',
      'es': 'Rendirse es peor que no haber empezado nunca.',
      'fr': 'Abandonner est pire que de n\'avoir jamais commencé.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zihin bedeni terk ettiğinde, irade devreye girer.',
      'en': 'When the mind abandons the body, willpower takes over.',
      'de': 'Wenn der Geist den Körper verlässt, übernimmt die Willenskraft.',
      'es': 'Cuando la mente abandona el cuerpo, la fuerza de voluntad toma el control.',
      'fr': 'Quand l\'esprit abandonne le corps, la volonté prend le relais.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Her yara, eski zayıflığının cenazesidir.',
      'en': 'Every scar is the funeral of your old weakness.',
      'de': 'Jede Narbe ist das Begräbnis deiner alten Schwäche.',
      'es': 'Cada cicatriz es el funeral de tu antigua debilidad.',
      'fr': 'Chaque cicatrice est les funérailles de ton ancienne faiblesse.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Gölgen bile senin peşindeyken, neden yerinde sayıyorsun?',
      'en': 'Even your shadow follows you; why are you standing still?',
      'de': 'Sogar dein Schatten folgt dir; warum stehst du still?',
      'es': 'Incluso tu sombra te sigue; ¿por qué te quedas quieto?',
      'fr': 'Même ton ombre te suit ; pourquoi restes-tu immobile ?',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zaman asla beklemez, senin de beklememen gerekir.',
      'en': 'Time never waits, and neither should you.',
      'de': 'Die Zeit wartet nie, und du solltest es auch nicht tun.',
      'es': 'El tiempo nunca espera, y tú tampoco deberías.',
      'fr': 'Le temps n\'attend jamais, et toi non plus.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Ağrı, kaslarından ayrılan tembelliğin feryadıdır.',
      'en': 'Pain is the cry of laziness leaving your muscles.',
      'de': 'Schmerz ist der Schrei der Faulheit, die deine Muskeln verlässt.',
      'es': 'El dolor es el grito de la pereza abandonando tus músculos.',
      'fr': 'La douleur est le cri de la paresse quittant tes muscles.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Yorulduğunda değil, başardığında dur.',
      'en': 'Stop when you are done, not when you are tired.',
      'de': 'Hör auf, wenn du fertig bist, nicht wenn du müde bist.',
      'es': 'Detente cuando hayas terminado, no cuando estés cansado.',
      'fr': 'Arrête-toi quand tu as fini, pas quand tu es fatigué.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Kolay olsaydı, herkes yapardı.',
      'en': 'If it were easy, everyone would do it.',
      'de': 'Wenn es einfach wäre, würde es jeder tun.',
      'es': 'Si fuera fácil, todos lo harían.',
      'fr': 'Si c\'était facile, tout le monde le ferait.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Tarih, sadece sonuna kadar gidenleri yazar.',
      'en': 'History only remembers those who go all the way.',
      'de': 'Die Geschichte erinnert sich nur an diejenigen, die bis zum Ende gehen.',
      'es': 'La historia solo recuerda a los que llegan hasta el final.',
      'fr': 'L\'histoire ne se souvient que de ceux qui vont jusqu\'au bout.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Limitlerin, sadece zihnindeki duvarlardır.',
      'en': 'Your limits are just the walls in your mind.',
      'de': 'Deine Grenzen sind nur die Mauern in deinem Kopf.',
      'es': 'Tus límites son solo los muros de tu mente.',
      'fr': 'Tes limites ne sont que les murs de ton esprit.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Sessizlikte çalış, başarın ses getirsin.',
      'en': 'Work in silence, let your success make the noise.',
      'de': 'Arbeite in Stille, lass deinen Erfolg den Lärm machen.',
      'es': 'Trabaja en silencio, deja que tu éxito haga el ruido.',
      'fr': 'Travaille en silence, laisse ton succès faire du bruit.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Kaybedecek bir şeyin yoksa, kazanacak her şeyin vardır.',
      'en': 'When you have nothing to lose, you have everything to gain.',
      'de': 'Wenn du nichts zu verlieren hast, hast du alles zu gewinnen.',
      'es': 'Cuando no tienes nada que perder, tienes todo que ganar.',
      'fr': 'Quand on n\'a rien à perdre, on a tout à gagner.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Büyük zirveler, dik yokuşlar gerektirir.',
      'en': 'Great summits require steep climbs.',
      'de': 'Große Gipfel erfordern steile Anstiege.',
      'es': 'Grandes cimas requieren ascensos empinados.',
      'fr': 'Les grands sommets exigent des ascensions raides.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Savaşçı ruh, vazgeçmenin lüks olmadığını bilir.',
      'en': 'The warrior spirit knows that giving up is not a luxury.',
      'de': 'Der Kriegergeist weiß, dass Aufgeben kein Luxus ist.',
      'es': 'El espíritu guerrero sabe que rendirse no es un lujo.',
      'fr': 'L\'esprit guerrier sait qu\'abandonner n\'est pas un luxe.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Ödülünü, gösterdiğin çabanın büyüklüğü belirler.',
      'en': 'The size of your effort determines your reward.',
      'de': 'Die Größe deiner Anstrengung bestimmt deine Belohnung.',
      'es': 'El tamaño de tu esfuerzo determina tu recompensa.',
      'fr': 'La taille de ton effort détermine ta récompense.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zafer inananın değil, savaşanındır.',
      'en': 'Victory belongs not to the believer, but to the fighter.',
      'de': 'Der Sieg gehört nicht dem Gläubigen, sondern dem Kämpfer.',
      'es': 'La victoria no pertenece al creyente, sino al luchador.',
      'fr': 'La victoire n\'appartient pas à celui qui y croit, mais à celui qui se bat.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Ya bir yol bul, ya da bir yol aç.',
      'en': 'Either find a way, or make one.',
      'de': 'Finde entweder einen Weg oder mach dir einen.',
      'es': 'Encuentra un camino, o haz uno.',
      'fr': 'Trouve un moyen, ou crées-en un.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Disiplin, geleceğinle yaptığın bir kontrattır.',
      'en': 'Discipline is a contract you make with your future.',
      'de': 'Disziplin ist ein Vertrag, den du mit deiner Zukunft schließt.',
      'es': 'La disciplina es un contrato que haces con tu futuro.',
      'fr': 'La discipline est un contrat que tu passes avec ton avenir.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zayıflık, geliştirilmeyi bekleyen gizli bir güçtür.',
      'en': 'Weakness is a hidden strength waiting to be developed.',
      'de': 'Schwäche ist eine verborgene Stärke, die darauf wartet, entwickelt zu werden.',
      'es': 'La debilidad es una fuerza oculta que espera ser desarrollada.',
      'fr': 'La faiblesse est une force cachée qui attend d\'être développée.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Aynadaki düşmanını alt etmeden, sahaya inemezsin.',
      'en': 'You cannot step onto the battlefield until you defeat the enemy in the mirror.',
      'de': 'Du kannst das Schlachtfeld nicht betreten, bis du den Feind im Spiegel besiegst.',
      'es': 'No puedes salir al campo de batalla hasta que derrotes al enemigo en el espejo.',
      'fr': 'Tu ne peux pas entrer sur le champ de bataille tant que tu n\'as pas vaincu l\'ennemi dans le miroir.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Korkularından değil, hedeflerinden ilham al.',
      'en': 'Draw inspiration from your goals, not your fears.',
      'de': 'Lass dich von deinen Zielen inspirieren, nicht von deinen Ängsten.',
      'es': 'Inspírate en tus objetivos, no en tus miedos.',
      'fr': 'Inspire-toi de tes objectifs, pas de tes peurs.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Çeliği sağlamlaştıran, yediği çekiç darbeleridir.',
      'en': 'It is the hammer blows that strengthen the steel.',
      'de': 'Es sind die Hammerschläge, die den Stahl härten.',
      'es': 'Son los golpes de martillo los que fortalecen el acero.',
      'fr': 'Ce sont les coups de marteau qui renforcent l\'acier.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Acı senin öğretmenin; onu dinlemeyi öğren.',
      'en': 'Pain is your teacher; learn to listen to it.',
      'de': 'Schmerz ist dein Lehrer; lerne, ihm zuzuhören.',
      'es': 'El dolor es tu maestro; aprende a escucharlo.',
      'fr': 'La douleur est ton maître ; apprends à l\'écouter.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Şampiyonlar molalarda değil, arenada doğar.',
      'en': 'Champions are not born in breaks, but in the arena.',
      'de': 'Champions werden nicht in Pausen geboren, sondern in der Arena.',
      'es': 'Los campeones no nacen en los descansos, sino en la arena.',
      'fr': 'Les champions ne naissent pas pendant les pauses, mais dans l\'arène.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bekleme, yarat.',
      'en': 'Don\'t wait, create.',
      'de': 'Warte nicht, erschaffe.',
      'es': 'No esperes, crea.',
      'fr': 'N\'attends pas, crée.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Kendini fethet, dünyayı fethetmiş sayılırsın.',
      'en': 'Conquer yourself, and you have conquered the world.',
      'de': 'Erobere dich selbst, und du hast die Welt erobert.',
      'es': 'Conquístese a sí mismo y habrá conquistado el mundo.',
      'fr': 'Conquiers-toi, et tu auras conquis le monde.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Rahatlık, potansiyelin en büyük düşmanıdır.',
      'en': 'Comfort is the greatest enemy of potential.',
      'de': 'Bequemlichkeit ist der größte Feind des Potenzials.',
      'es': 'La comodidad es el mayor enemigo del potencial.',
      'fr': 'Le confort est le plus grand ennemi du potentiel.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Başına gelenler değil, onlara nasıl tepki verdiğin önemlidir.',
      'en': 'It\'s not what happens to you, but how you react to it that matters.',
      'de': 'Es ist nicht das, was dir passiert, sondern wie du darauf reagierst.',
      'es': 'No es lo que te pasa, sino cómo reaccionas a ello lo que importa.',
      'fr': 'Ce n\'est pas ce qui vous arrive, mais comment vous y réagissez qui importe.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Düşersen kalk. Tekrar düşersen daha güçlü kalk.',
      'en': 'If you fall, get up. If you fall again, get up stronger.',
      'de': 'Wenn du fällst, steh auf. Wenn du wieder fällst, steh stärker auf.',
      'es': 'Si te caes, levántate. Si te caes de nuevo, levántate más fuerte.',
      'fr': 'Si tu tombes, lève-toi. Si tu tombes encore, lève-toi plus fort.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Binlerce günlük eğitim sadece bir başlangıçtır.',
      'en': 'A thousand days of training is just the beginning.',
      'de': 'Tausend Tage Training sind nur der Anfang.',
      'es': 'Mil días de entrenamiento son solo el principio.',
      'fr': 'Mille jours d\'entraînement ne sont que le début.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugünkü terin, yarınki zırhındır.',
      'en': 'Today\'s sweat is tomorrow\'s armor.',
      'de': 'Der Schweiß von heute ist die Rüstung von morgen.',
      'es': 'El sudor de hoy es la armadura de mañana.',
      'fr': 'La sueur d\'aujourd\'hui est l\'armure de demain.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Ateş altını test eder, zorluklar ise güçlü insanları.',
      'en': 'Fire tests gold, adversity tests strong men.',
      'de': 'Feuer prüft Gold, Widrigkeiten prüfen starke Männer.',
      'es': 'El fuego prueba el oro, la adversidad prueba a los hombres fuertes.',
      'fr': 'Le feu éprouve l\'or, l\'adversité éprouve les hommes forts.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Hayal kurmayı bırak, plan yapmaya başla.',
      'en': 'Stop dreaming, start planning.',
      'de': 'Hör auf zu träumen, fang an zu planen.',
      'es': 'Deja de soñar, empieza a planificar.',
      'fr': 'Arrête de rêver, commence à planifier.',
    },
  ),
  Quote(
    author: 'Sun Tzu',
    localizedText: {
      'tr': 'Zafere giden yol, önce zihinde kazanılır.',
      'en': 'The road to victory is first won in the mind.',
      'de': 'Der Weg zum Sieg wird zuerst im Geist gewonnen.',
      'es': 'El camino a la victoria se gana primero en la mente.',
      'fr': 'La route de la victoire se gagne d\'abord dans l\'esprit.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Yorulduğunda değil, başardığında dur.',
      'en': 'Stop when you achieve, not when you are tired.',
      'de': 'Hör auf, wenn du es erreicht hast, nicht wenn du müde bist.',
      'es': 'Detente cuando lo logres, no cuando estés cansado.',
      'fr': 'Arrête-toi quand tu as réussi, pas quand tu es fatigué.',
    },
  ),
  Quote(
    author: 'Lao Tzu',
    localizedText: {
      'tr': 'Bin millik yolculuk, tek bir adımla başlar.',
      'en': 'A journey of a thousand miles begins with a single step.',
      'de': 'Eine Reise von tausend Meilen beginnt mit einem einzigen Schritt.',
      'es': 'Un viaje de mil millas comienza con un solo paso.',
      'fr': 'Un voyage de mille milles commence par un seul pas.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Mazeretler zayıfların sığınağıdır.',
      'en': 'Excuses are the refuge of the weak.',
      'de': 'Ausreden sind die Zuflucht der Schwachen.',
      'es': 'Las excusas son el refugio de los débiles.',
      'fr': 'Les excuses sont le refuge des faibles.',
    },
  ),
  Quote(
    author: 'Gengis Khan',
    localizedText: {
      'tr': 'Eylemdeki kararlılık, her türlü engeli aşar.',
      'en': 'Determination in action overcomes any obstacle.',
      'de': 'Entschlossenheit im Handeln überwindet jedes Hindernis.',
      'es': 'La determinación en la acción supera cualquier obstáculo.',
      'fr': 'La détermination dans l\'action surmonte tout obstacle.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Eğer kolay olsaydı, herkes yapardı.',
      'en': 'If it were easy, everyone would do it.',
      'de': 'Wenn es einfach wäre, würde es jeder tun.',
      'es': 'Si fuera fácil, todos lo harían.',
      'fr': 'Si c\'était facile, tout le monde le ferait.',
    },
  ),
  Quote(
    author: 'Spartalılar',
    localizedText: {
      'tr': 'Barışta daha çok terleyen, savaşta daha az kanar.',
      'en': 'He who sweats more in peace bleeds less in war.',
      'de': 'Wer im Frieden mehr schwitzt, blutet im Krieg weniger.',
      'es': 'El que suda más en la paz sangra menos en la guerra.',
      'fr': 'Celui qui transpire plus en temps de paix saigne moins en temps de guerre.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugün yaptığın fedakarlık, yarınki ödülündür.',
      'en': 'The sacrifice you make today is your reward tomorrow.',
      'de': 'Das Opfer, das du heute bringst, ist deine Belohnung von morgen.',
      'es': 'El sacrificio que haces hoy es tu recompensa mañana.',
      'fr': 'Le sacrifice que tu fais aujourd\'hui est ta récompense de demain.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'En iyi intikam, sana zarar verene benzememektir.',
      'en': 'The best revenge is to be unlike him who performed the injury.',
      'de': 'Die beste Rache ist es, nicht wie der zu sein, der dir Schaden zugefügt hat.',
      'es': 'La mejor venganza es no ser como el que te lastimó.',
      'fr': 'La meilleure vengeance est de ne pas ressembler à celui qui t\'a fait du mal.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Pes etmek için henüz çok erken.',
      'en': 'It is too early to give up.',
      'de': 'Es ist zu früh, um aufzugeben.',
      'es': 'Es demasiado pronto para rendirse.',
      'fr': 'Il est trop tôt pour abandonner.',
    },
  ),
  Quote(
    author: 'Winston Churchill',
    localizedText: {
      'tr': 'Asla, asla, asla pes etme.',
      'en': 'Never, never, never give up.',
      'de': 'Niemals, niemals, niemals aufgeben.',
      'es': 'Nunca, nunca, nunca te rindas.',
      'fr': 'Ne jamais, jamais, jamais abandonner.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Disiplin, motivasyon bittiğinde seni ayakta tutandır.',
      'en': 'Discipline is what keeps you standing when motivation runs out.',
      'de': 'Disziplin ist das, was dich hält, wenn die Motivation nachlässt.',
      'es': 'La disciplina es lo que te mantiene en pie cuando se acaba la motivación.',
      'fr': 'La discipline est ce qui te maintient debout quand la motivation s\'épuise.',
    },
  ),
  Quote(
    author: 'Bruce Lee',
    localizedText: {
      'tr': 'Kolay bir hayat dileme, zor bir hayata dayanabilecek güç dile.',
      'en': 'Do not pray for an easy life, pray for the strength to endure a difficult one.',
      'de': 'Bete nicht um ein leichtes Leben, bete um die Kraft, ein schweres zu ertragen.',
      'es': 'No ores por una vida fácil, ora por la fuerza para soportar una difícil.',
      'fr': 'Ne prie pas pour une vie facile, prie pour la force de supporter une vie difficile.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Yarın daha güçlü uyanmak için bugün acıya dayan.',
      'en': 'Endure the pain today to wake up stronger tomorrow.',
      'de': 'Ertrage den Schmerz heute, um morgen stärker aufzuwachen.',
      'es': 'Soporta el dolor hoy para despertar más fuerte mañana.',
      'fr': 'Endure la douleur aujourd\'hui pour te réveiller plus fort demain.',
    },
  ),
  Quote(
    author: 'Herakleitos',
    localizedText: {
      'tr': 'Aynı nehirde iki kez yıkanılmaz; nehir değişir, sen değişirsin.',
      'en': 'No man ever steps in the same river twice, for it\'s not the same river and he\'s not the same man.',
      'de': 'Man steigt nicht zweimal in denselben Fluss, denn er ist nicht derselbe Fluss und er ist nicht derselbe Mensch.',
      'es': 'Ningún hombre pisa el mismo río dos veces, porque no es el mismo río y él no es el mismo hombre.',
      'fr': 'On ne se baigne jamais deux fois dans le même fleuve, car ce n\'est pas le même fleuve et ce n\'est pas le même homme.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Eğer hedefin seni korkutmuyorsa, yeterince büyük değildir.',
      'en': 'If your goal doesn\'t scare you, it isn\'t big enough.',
      'de': 'Wenn dein Ziel dich nicht erschreckt, ist es nicht groß genug.',
      'es': 'Si tu objetivo no te asusta, no es lo suficientemente grande.',
      'fr': 'Si ton objectif ne te fait pas peur, c\'est qu\'il n\'est pas assez grand.',
    },
  ),
  Quote(
    author: 'Sokrates',
    localizedText: {
      'tr': 'Dünyayı hareket ettirmek isteyen, önce kendini hareket ettirsin.',
      'en': 'Let him that would move the world first move himself.',
      'de': 'Wer die Welt bewegen will, sollte erst sich selbst bewegen.',
      'es': 'Aquel que quiera mover el mundo, que se mueva a sí mismo primero.',
      'fr': 'Que celui qui veut déplacer le monde se déplace d\'abord lui-même.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Başarı kiralıktır ve kirası her gün ödenmek zorundadır.',
      'en': 'Success is leased, and rent is due every day.',
      'de': 'Erfolg ist nur gemietet, und die Miete ist jeden Tag fällig.',
      'es': 'El éxito se alquila, y el alquiler se paga todos los días.',
      'fr': 'Le succès est loué, et le loyer est dû chaque jour.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Zorluklar bir savaşçının zihnini bileyen taştır.',
      'en': 'Difficulties are the stone that sharpens a warrior\'s mind.',
      'de': 'Schwierigkeiten sind der Stein, der den Geist eines Kriegers schärft.',
      'es': 'Las dificultades son la piedra que afila la mente de un guerrero.',
      'fr': 'Les difficultés sont la pierre qui aiguise l\'esprit d\'un guerrier.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Kendinden şüphe etmeyi bırak, çalışmaya başla.',
      'en': 'Stop doubting yourself and start working.',
      'de': 'Hör auf, an dir selbst zu zweifeln und fang an zu arbeiten.',
      'es': 'Deja de dudar de ti mismo y empieza a trabajar.',
      'fr': 'Arrête de douter de toi-même et commence à travailler.',
    },
  ),
  Quote(
    author: 'Alexander the Great',
    localizedText: {
      'tr': 'Korkularını yenen biri için imkansız yoktur.',
      'en': 'There is nothing impossible to him who will try.',
      'de': 'Für den, der es versucht, gibt es nichts Unmögliches.',
      'es': 'No hay nada imposible para el que lo intente.',
      'fr': 'Il n\'y a rien d\'impossible pour celui qui essaiera.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Odaklan. Dışarıdaki gürültü sadece bir illüzyon.',
      'en': 'Focus. The noise outside is just an illusion.',
      'de': 'Fokussieren. Der Lärm draußen ist nur eine Illusion.',
      'es': 'Enfócate. El ruido exterior es solo una ilusión.',
      'fr': 'Concentre-toi. Le bruit extérieur n\'est qu\'une illusion.',
    },
  ),
  Quote(
    author: 'Konfüçyüs',
    localizedText: {
      'tr': 'Durmadığın sürece ne kadar yavaş gittiğinin bir önemi yoktur.',
      'en': 'It does not matter how slowly you go as long as you do not stop.',
      'de': 'Es spielt keine Rolle, wie langsam du gehst, solange du nicht stehen bleibst.',
      'es': 'No importa lo lento que vayas siempre y cuando no te detengas.',
      'fr': 'Peu importe la lenteur avec laquelle vous allez tant que vous ne vous arrêtez pas.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugün yaptığın seçimler, yarınki zincirlerindir.',
      'en': 'The choices you make today are your chains tomorrow.',
      'de': 'Die Entscheidungen, die du heute triffst, sind deine Ketten von morgen.',
      'es': 'Las decisiones que tomas hoy son tus cadenas mañana.',
      'fr': 'Les choix que tu fais aujourd\'hui sont tes chaînes demain.',
    },
  ),
  Quote(
    author: 'Aristoteles',
    localizedText: {
      'tr': 'Biz, tekrar tekrar yaptığımız şeyiz. Demek ki mükemmellik bir eylem değil, bir alışkanlıktır.',
      'en': 'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
      'de': 'Wir sind das, was wir wiederholt tun. Exzellenz ist also keine Handlung, sondern eine Gewohnheit.',
      'es': 'Somos lo que hacemos repetidamente. La excelencia, entonces, no es un acto, sino un hábito.',
      'fr': 'Nous sommes ce que nous faisons de manière répétée. L\'excellence n\'est donc pas un acte, mais une habitude.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Aynadaki kişiden daha büyük bir rakip yoktur.',
      'en': 'There is no greater opponent than the person in the mirror.',
      'de': 'Es gibt keinen größeren Gegner als die Person im Spiegel.',
      'es': 'No hay mayor oponente que la persona en el espejo.',
      'fr': 'Il n\'y a pas de plus grand adversaire que la personne dans le miroir.',
    },
  ),
  Quote(
    author: 'Julius Caesar',
    localizedText: {
      'tr': 'Geldim, gördüm, yendim.',
      'en': 'I came, I saw, I conquered.',
      'de': 'Ich kam, ich sah, ich siegte.',
      'es': 'Vine, vi, vencí.',
      'fr': 'Je suis venu, j\'ai vu, j\'ai vaincu.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Eğer kırılmazsan, yenilmezsin.',
      'en': 'If you do not break, you cannot be defeated.',
      'de': 'Wenn du nicht brichst, kannst du nicht besiegt werden.',
      'es': 'Si no te rompes, no puedes ser derrotado.',
      'fr': 'Si tu ne te brises pas, tu ne peux pas être vaincu.',
    },
  ),
  Quote(
    author: 'Friedrich Nietzsche',
    localizedText: {
      'tr': 'Beni öldürmeyen şey beni güçlendirir.',
      'en': 'What does not kill me makes me stronger.',
      'de': 'Was mich nicht umbringt, macht mich stärker.',
      'es': 'Lo que no me mata me hace más fuerte.',
      'fr': 'Ce qui ne me tue pas me rend plus fort.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zihnini ustalaştır, aksi takdirde o sana ustalık taslar.',
      'en': 'Master your mind, or it will master you.',
      'de': 'Beherrsche deinen Geist, oder er wird dich beherrschen.',
      'es': 'Domina tu mente, o ella te dominará a ti.',
      'fr': 'Maîtrise ton esprit, ou c\'est lui qui te maîtrisera.',
    },
  ),
  Quote(
    author: 'Rocky Balboa',
    localizedText: {
      'tr': 'Hayatın ne kadar sert vurduğu önemli değil. Önemli olan, ne kadar sert darbe alıp ilerlemeye devam edebildiğindir.',
      'en': 'It ain\'t about how hard you hit. It\'s about how hard you can get hit and keep moving forward.',
      'de': 'Es geht nicht darum, wie hart du zuschlagen kannst. Es geht darum, wie viele Schläge du einstecken kannst und trotzdem weitergehst.',
      'es': 'No se trata de qué tan fuerte golpees. Se trata de qué tan fuerte pueden golpearte y seguir avanzando.',
      'fr': 'Il ne s\'agit pas de la force avec laquelle tu frappes. Il s\'agit de la force avec laquelle tu peux être frappé et continuer d\'avancer.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Her yeni gün, daha iyi olman için verilmiş yeni bir şanstır.',
      'en': 'Every new day is a new chance to be better.',
      'de': 'Jeder neue Tag ist eine neue Chance, besser zu werden.',
      'es': 'Cada nuevo día es una nueva oportunidad para ser mejor.',
      'fr': 'Chaque nouveau jour est une nouvelle chance d\'être meilleur.',
    },
  ),
  Quote(
    author: 'Platon',
    localizedText: {
      'tr': 'Kendine hakim olmak, tüm zaferlerin en büyüğüdür.',
      'en': 'To conquer oneself is the greatest of all victories.',
      'de': 'Sich selbst zu besiegen, ist der größte aller Siege.',
      'es': 'Conquistarse a uno mismo es la mayor de todas las victorias.',
      'fr': 'Se conquérir soi-même est la plus grande de toutes les victoires.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Yüzünü güneşe dön, gölgeler arkanda kalsın.',
      'en': 'Turn your face to the sun and the shadows fall behind you.',
      'de': 'Wende dein Gesicht der Sonne zu, und die Schatten fallen hinter dich.',
      'es': 'Vuelve tu rostro hacia el sol y las sombras caerán detrás de ti.',
      'fr': 'Tourne ton visage vers le soleil et les ombres tomberont derrière toi.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Şans, hazırlığın fırsatla buluştuğu zamandır.',
      'en': 'Luck is what happens when preparation meets opportunity.',
      'de': 'Glück ist, was passiert, wenn Vorbereitung auf Gelegenheit trifft.',
      'es': 'La suerte es lo que sucede cuando la preparación se encuentra con la oportunidad.',
      'fr': 'La chance, c\'est quand la préparation rencontre l\'opportunité.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Bugün bir kurban mısın, yoksa bir savaşçı mı? Seçim senin.',
      'en': 'Are you a victim today, or a warrior? The choice is yours.',
      'de': 'Bist du heute ein Opfer oder ein Krieger? Die Wahl liegt bei dir.',
      'es': '¿Eres una víctima hoy o un guerrero? La elección es tuya.',
      'fr': 'Es-tu une victime aujourd\'hui, ou un guerrier ? Le choix t\'appartient.',
    },
  ),
  Quote(
    author: 'Lao Tzu',
    localizedText: {
      'tr': 'Başkalarını bilen kimse bilgili, kendini bilen kimse bilgedir.',
      'en': 'Knowing others is intelligence; knowing yourself is true wisdom.',
      'de': 'Andere zu kennen ist Intelligenz; sich selbst zu kennen ist wahre Weisheit.',
      'es': 'Conocer a otros es inteligencia; conocerte a ti mismo es verdadera sabiduría.',
      'fr': 'Connaître les autres, c\'est de l\'intelligence ; se connaître soi-même, c\'est de la vraie sagesse.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Terk edilmiş hedefler mezarlığına bir yenisini daha ekleme.',
      'en': 'Do not add another one to the graveyard of abandoned goals.',
      'de': 'Füge dem Friedhof aufgegebener Ziele kein weiteres hinzu.',
      'es': 'No añadas uno más al cementerio de metas abandonadas.',
      'fr': 'N\'en ajoute pas un autre au cimetière des objectifs abandonnés.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Hiçbir şey için pişmanlık duyma.',
      'en': 'Do nothing that is of no use.',
      'de': 'Tue nichts, was keinen Nutzen hat.',
      'es': 'No hagas nada que no sea de utilidad.',
      'fr': 'Ne fais rien qui ne soit d\'aucune utilité.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Uyan! Rüyalarını ancak gözlerin açıkken gerçekleştirebilirsin.',
      'en': 'Wake up! You can only make your dreams come true with your eyes open.',
      'de': 'Wach auf! Du kannst deine Träume nur mit offenen Augen verwirklichen.',
      'es': '¡Despierta! Solo puedes hacer realidad tus sueños con los ojos abiertos.',
      'fr': 'Réveille-toi ! Tu ne peux réaliser tes rêves qu\'avec les yeux ouverts.',
    },
  ),
  Quote(
    author: 'Muhammed Ali',
    localizedText: {
      'tr': 'Eğer benimle dövüşmeyi hayal ediyorsan, uyanıp özür dilemelisin.',
      'en': 'If you even dream of beating me you\'d better wake up and apologize.',
      'de': 'Wenn du auch nur davon träumst, mich zu schlagen, solltest du besser aufwachen und dich entschuldigen.',
      'es': 'Si siquiera sueñas con vencerme, será mejor que despiertes y te disculpes.',
      'fr': 'Si tu rêves même de me battre, tu ferais mieux de te réveiller et de t\'excuser.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Mükemmelliği arama, gelişimi ara.',
      'en': 'Don\'t seek perfection, seek progress.',
      'de': 'Suche nicht nach Perfektion, suche nach Fortschritt.',
      'es': 'No busques la perfección, busca el progreso.',
      'fr': 'Ne cherche pas la perfection, cherche le progrès.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Eğer bir adam hangi limana yelken açtığını bilmiyorsa, hiçbir rüzgar onun için doğru rüzgar değildir.',
      'en': 'If a man knows not to which port he sails, no wind is favorable.',
      'de': 'Wenn ein Mann nicht weiß, welchen Hafen er ansteuert, ist kein Wind günstig.',
      'es': 'Si un hombre no sabe a qué puerto navega, ningún viento es favorable.',
      'fr': 'Si un homme ne sait pas vers quel port il navigue, aucun vent n\'est favorable.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Potansiyelini çöpe atma.',
      'en': 'Do not throw your potential in the trash.',
      'de': 'Wirf dein Potenzial nicht in den Müll.',
      'es': 'No tires tu potencial a la basura.',
      'fr': 'Ne jette pas ton potentiel à la poubelle.',
    },
  ),
  Quote(
    author: 'Albert Einstein',
    localizedText: {
      'tr': 'Hayat bisiklete binmek gibidir. Dengede kalmak için hareket etmeye devam etmelisin.',
      'en': 'Life is like riding a bicycle. To keep your balance, you must keep moving.',
      'de': 'Das Leben ist wie Fahrradfahren. Um die Balance zu halten, musst du in Bewegung bleiben.',
      'es': 'La vida es como andar en bicicleta. Para mantener el equilibrio, debes seguir moviéndote.',
      'fr': 'La vie, c\'est comme faire du vélo. Pour garder l\'équilibre, il faut continuer à avancer.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Her ağrı bir derstir. Her ders bir güçtür.',
      'en': 'Every pain is a lesson. Every lesson is strength.',
      'de': 'Jeder Schmerz ist eine Lektion. Jede Lektion ist Stärke.',
      'es': 'Cada dolor es una lección. Cada lección es fuerza.',
      'fr': 'Chaque douleur est une leçon. Chaque leçon est une force.',
    },
  ),
  Quote(
    author: 'Mevlana',
    localizedText: {
      'tr': 'Sen yürümeye başlayınca yol kendiliğinden görünür.',
      'en': 'As you start to walk out on the way, the way appears.',
      'de': 'Wenn du anfängst, auf dem Weg zu gehen, erscheint der Weg.',
      'es': 'Al empezar a caminar por el camino, aparece el camino.',
      'fr': 'Au fur et à mesure que vous commencez à marcher sur le chemin, le chemin apparaît.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Karanlıkta parlayanlar, karanlıktan korkmayanlardır.',
      'en': 'Those who shine in the dark are those who do not fear the dark.',
      'de': 'Diejenigen, die im Dunkeln leuchten, sind diejenigen, die die Dunkelheit nicht fürchten.',
      'es': 'Los que brillan en la oscuridad son los que no temen a la oscuridad.',
      'fr': 'Ceux qui brillent dans le noir sont ceux qui n\'ont pas peur du noir.',
    },
  ),
  Quote(
    author: 'Sun Tzu',
    localizedText: {
      'tr': 'En büyük zafer, savaşmadan kazanılan zaferdir.',
      'en': 'The greatest victory is that which requires no battle.',
      'de': 'Der größte Sieg ist derjenige, der keine Schlacht erfordert.',
      'es': 'La mayor victoria es aquella que no requiere batalla.',
      'fr': 'La plus grande victoire est celle qui ne nécessite aucune bataille.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Güçlü olmak, asla düşmemek değil; her düştüğünde kalkmaktır.',
      'en': 'Being strong is not about never falling, but getting up every time you fall.',
      'de': 'Stark zu sein bedeutet nicht, niemals zu fallen, sondern jedes Mal aufzustehen, wenn man fällt.',
      'es': 'Ser fuerte no se trata de no caer nunca, sino de levantarse cada vez que te caes.',
      'fr': 'Être fort ne consiste pas à ne jamais tomber, mais à se relever à chaque fois qu\'on tombe.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Mutluluğunuz, düşüncelerinizin kalitesine bağlıdır.',
      'en': 'Your happiness depends on the quality of your thoughts.',
      'de': 'Dein Glück hängt von der Qualität deiner Gedanken ab.',
      'es': 'Tu felicidad depende de la calidad de tus pensamientos.',
      'fr': 'Votre bonheur dépend de la qualité de vos pensées.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Kaderini sen yaz.',
      'en': 'Write your own destiny.',
      'de': 'Schreibe dein eigenes Schicksal.',
      'es': 'Escribe tu propio destino.',
      'fr': 'Écris ton propre destin.',
    },
  ),
  Quote(
    author: 'Napoleon Bonaparte',
    localizedText: {
      'tr': 'İmkansız, sadece aptalların sözlüğünde bulunan bir kelimedir.',
      'en': 'Impossible is a word to be found only in the dictionary of fools.',
      'de': 'Unmöglich ist ein Wort, das man nur im Wörterbuch der Narren findet.',
      'es': 'Imposible es una palabra que solo se encuentra en el diccionario de los tontos.',
      'fr': 'Impossible n\'est pas français.',
    },
  ),
  // --- ADDITIONAL WARRIOR & STOIC QUOTES (v1.0.0+12 UPDATE) ---
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'YaptÄ±ÄŸÄ±n her iÅŸte karakterini ortaya koy.',
      'en': 'Demonstrate your character in everything you do.',
      'de': 'Zeige deinen Charakter in allem, was du tust.',
      'es': 'Demuestra tu carÃ¡cter en todo lo que haces.',
      'fr': 'Fais preuve de caractÃ¨re dans tout ce que tu fais.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Sabah kalktÄ±ÄŸÄ±nda yaÅŸamanÄ±n, dÃ¼ÅŸÃ¼nmenin ve sevmenin ne bÃ¼yÃ¼k bir ayrÄ±calÄ±k olduÄŸunu dÃ¼ÅŸÃ¼n.',
      'en': 'When you arise in the morning think of what a privilege it is to be alive, to think, to enjoy, to love.',
      'de': 'Wenn du morgens aufstehst, denke daran, was fÃ¼r ein Privileg es ist, zu leben, zu denken, zu genieÃŸen, zu lieben.',
      'es': 'Al levantarte por la maÃ±ana, piensa en quÃ© privilegio es estar vivo, pensar, disfrutar, amar.',
      'fr': 'Le matin, quand tu te lÃ¨ves, pense au privilÃ¨ge d''Ãªtre en vie, de penser, de jouir, d''aimer.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Zorluklar zihni gÃ¼Ã§lendirir, tÄ±pkÄ± Ã§alÄ±ÅŸmanÄ±n bedeni gÃ¼Ã§lendirdiÄŸi gibi.',
      'en': 'Difficulties strengthen the mind, as labor does the body.',
      'de': 'Schwierigkeiten stÃ¤rken den Geist, so wie Arbeit den KÃ¶rper stÃ¤rkt.',
      'es': 'Las dificultades fortalecen la mente, como el trabajo lo hace con el cuerpo.',
      'fr': 'Les difficultÃ©s fortifient l''esprit, comme le travail fortifie le corps.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Bir yolu iyice kavrarsan, binbir yolu da kavrarsÄ±n.',
      'en': 'If you know the way broadly, you will see it in all things.',
      'de': 'Wenn du den Weg im GroÃŸen kennst, wirst du ihn in allen Dingen sehen.',
      'es': 'Si conoces el camino ampliamente, lo verÃ¡s en todas las cosas.',
      'fr': 'Si tu connais la voie dans son ensemble, tu la verras en toute chose.',
    },
  ),
  Quote(
    author: 'Sun Tzu',
    localizedText: {
      'tr': 'Kriz anÄ±, fÄ±rsatÄ±n doruk noktasÄ±dÄ±r.',
      'en': 'In the midst of chaos, there is also opportunity.',
      'de': 'Mitten im Chaos liegt auch eine Chance.',
      'es': 'En medio del caos, tambiÃ©n hay oportunidad.',
      'fr': 'Au milieu du chaos, il y a aussi une opportunitÃ©.',
    },
  ),
  Quote(
    author: 'Alexander the Great',
    localizedText: {
      'tr': 'Ã‡abalamaktan korkmayanlar iÃ§in imkansÄ±z diye bir ÅŸey yoktur.',
      'en': 'There is nothing impossible to him who will try.',
      'de': 'Es gibt nichts UnmÃ¶gliches fÃ¼r denjenigen, der es versucht.',
      'es': 'No hay nada imposible para quien lo intenta.',
      'fr': 'Il n''y a rien d''impossible pour celui qui essaie.',
    },
  ),
  Quote(
    author: 'Julius Caesar',
    localizedText: {
      'tr': 'Geldim, gÃ¶rdÃ¼m, yendim.',
      'en': 'I came, I saw, I conquered.',
      'de': 'Ich kam, ich sah, ich siegte.',
      'es': 'LleguÃ©, vi, vencÃ­.',
      'fr': 'Je suis venu, j''ai vu, j''ai vaincu.',
    },
  ),
  Quote(
    author: 'Aristoteles',
    localizedText: {
      'tr': 'Biz tekrar tekrar yaptÄ±ÄŸÄ±mÄ±z ÅŸeyiz. MÃ¼kemmellik bir eylem deÄŸil, bir alÄ±ÅŸkanlÄ±ktÄ±r.',
      'en': 'We are what we repeatedly do. Excellence, then, is not an act, but a habit.',
      'de': 'Wir sind das, was wir wiederholt tun. VorzÃ¼glichkeit ist also keine Handlung, sondern eine Gewohnheit.',
      'es': 'Somos lo que hacemos repetidamente. La excelencia, entonces, no es un acto, sino un hÃ¡bito.',
      'fr': 'Nous sommes ce que nous rÃ©pÃ©tons chaque jour. L''excellence n''est donc pas un acte, mais une habitude.',
    },
  ),
  Quote(
    author: 'Bruce Lee',
    localizedText: {
      'tr': 'Kolay bir hayat dilemeyin, zor olana dayanacak gÃ¼Ã§ dileyin.',
      'en': 'Do not pray for an easy life, pray for the strength to endure a difficult one.',
      'de': 'Bete nicht fÃ¼r ein einfaches Leben, bete fÃ¼r die Kraft, ein schweres zu ertragen.',
      'es': 'No pidas una vida fÃ¡cil, pide la fuerza para soportar una difÃ­cil.',
      'fr': 'Ne prie pas pour une vie facile, prie pour avoir la force d''en endurer une difficile.',
    },
  ),
  Quote(
    author: 'Winston Churchill',
    localizedText: {
      'tr': 'BaÅŸarÄ± nihai deÄŸildir, baÅŸarÄ±sÄ±zlÄ±k Ã¶lÃ¼mcÃ¼l deÄŸildir; Ã¶nemli olan devam etme cesaretidir.',
      'en': 'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      'de': 'Erfolg ist nicht endgÃ¼ltig, Misserfolg ist nicht fatal: Es ist der Mut weiterzumachen, der zÃ¤hlt.',
      'es': 'El Ã©xito no es definitivo, el fracaso no es fatal: lo que cuenta es el valor para continuar.',
      'fr': 'Le succÃ¨s n''est pas final, l''Ã©chec n''est pas fatal : c''est le courage de continuer qui compte.',
    },
  ),
  Quote(
    author: 'Theodore Roosevelt',
    localizedText: {
      'tr': 'YapabileceÄŸine inan, yolun yarÄ±sÄ±nÄ± katetmiÅŸ olursun.',
      'en': 'Believe you can and you''re halfway there.',
      'de': 'Glaube daran, dass du es kannst, und du hast den halben Weg geschafft.',
      'es': 'Cree que puedes y ya estÃ¡s a medio camino.',
      'fr': 'Crois que tu en es capable et tu es dÃ©jÃ  Ã  mi-chemin.',
    },
  ),
  Quote(
    author: 'Lao Tzu',
    localizedText: {
      'tr': 'Bin millik bir yolculuk tek bir adÄ±mla baÅŸlar.',
      'en': 'A journey of a thousand miles begins with a single step.',
      'de': 'Eine Reise von tausend Meilen beginnt mit einem einzigen Schritt.',
      'es': 'Un viaje de mil millas comienza con un solo paso.',
      'fr': 'Un voyage de mille milles commence par un seul pas.',
    },
  ),
  Quote(
    author: 'Friedrich Nietzsche',
    localizedText: {
      'tr': 'YaÅŸamak iÃ§in bir nedeni olan, her tÃ¼rlÃ¼ nasÄ±la katlanabilir.',
      'en': 'He who has a why to live can bear almost any how.',
      'de': 'Wer ein Wozu zum Leben hat, ertrÃ¤gt fast jedes Wie.',
      'es': 'Quien tiene un porquÃ© para vivir se puede enfrentar a todos los cÃ³mos.',
      'fr': 'Celui qui a un pourquoi vivre peut supporter n''importe quel comment.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'BugÃ¼n ter dÃ¶k, yarÄ±n zaferin tadÄ±nÄ± Ã§Ä±kar.',
      'en': 'Sweat today, enjoy your victory tomorrow.',
      'de': 'Schwitze heute, genieÃŸe morgen deinen Sieg.',
      'es': 'Suda hoy, disfruta tu victoria maÃ±ana.',
      'fr': 'Transpire aujourd''hui, savoure ta victoire demain.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Sadece eÄŸitimli olanlar Ã¶zgÃ¼rdÃ¼r.',
      'en': 'Only the educated are free.',
      'de': 'Nur die Gebildeten sind frei.',
      'es': 'Solo los educados son libres.',
      'fr': 'Seuls les instruits sont libres.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Engeller yolun kendisidir. Eylemin Ã¶nÃ¼ndeki engel, eylemi ilerletir.',
      'en': 'The impediment to action advances action. What stands in the way becomes the way.',
      'de': 'Das Hindernis fÃ¼r das Handeln fÃ¶rdert das Handeln. Was im Weg steht, wird zum Weg.',
      'es': 'El impedimento a la acciÃ³n avanza la acciÃ³n. Lo que se interpone en el camino se convierte en el camino.',
      'fr': 'L''obstacle Ã  l''action avance l''action. Ce qui se dresse sur le chemin devient le chemin.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Talih, hazÄ±rlÄ±klÄ± zihinlerle karÅŸÄ±laÅŸÄ±nca ÅŸans adÄ±nÄ± alÄ±r.',
      'en': 'Luck is what happens when preparation meets opportunity.',
      'de': 'GlÃ¼ck ist das, was passiert, wenn Vorbereitung auf Gelegenheit trifft.',
      'es': 'La suerte es lo que ocurre cuando la preparaciÃ³n se encuentra con la oportunidad.',
      'fr': 'La chance, c''est ce qui arrive quand la prÃ©paration rencontre l''opportunitÃ©.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'HÄ±zlÄ± olmak yavaÅŸlamamaktÄ±r. DÃ¼zenli adÄ±m atan asla geride kalmaz.',
      'en': 'To be fast is not to rush. The steady step never falls behind.',
      'de': 'Schnell zu sein bedeutet nicht zu hetzen. Der stetige Schritt bleibt nie zurÃ¼ck.',
      'es': 'Ser rÃ¡pido no es apresurarse. El paso constante nunca se queda atrÃ¡s.',
      'fr': 'ÃŠtre rapide ne veut pas dire se prÃ©cipiter. Le pas rÃ©gulier ne reste jamais en arriÃ¨re.',
    },
  ),
  Quote(
    author: 'Sun Tzu',
    localizedText: {
      'tr': 'SavaÅŸmadan kazanmak en bÃ¼yÃ¼k zaferdir.',
      'en': 'The supreme art of war is to subdue the enemy without fighting.',
      'de': 'Die hÃ¶chste Kunst des Krieges ist es, den Feind ohne Kampf zu besiegen.',
      'es': 'El supremo arte de la guerra es someter al enemigo sin luchar.',
      'fr': 'L''art suprÃªme de la guerre est de soumettre l''ennemi sans combattre.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'AcÄ± geÃ§icidir, ama vazgeÃ§menin piÅŸmanlÄ±ÄŸÄ± sonsuza dek sÃ¼rer.',
      'en': 'Pain is temporary, but the regret of quitting lasts forever.',
      'de': 'Schmerz ist vorÃ¼bergehend, aber das Bedauern aufzugeben hÃ¤lt ewig an.',
      'es': 'El dolor es temporal, pero el arrepentimiento de rendirse dura para siempre.',
      'fr': 'La douleur est temporaire, mais le regret d''avoir abandonnÃ© dure toujours.',
    },
  ),
  Quote(
    author: 'Platon',
    localizedText: {
      'tr': 'Ä°lk ve en bÃ¼yÃ¼k zafer, kendini fethetmektir.',
      'en': 'The first and greatest victory is to conquer yourself.',
      'de': 'Der erste und grÃ¶ÃŸte Sieg ist es, sich selbst zu besiegen.',
      'es': 'La primera y mayor victoria es conquistarte a ti mismo.',
      'fr': 'La premiÃ¨re et la plus grande des victoires est de se vaincre soi-mÃªme.',
    },
  ),
  Quote(
    author: 'Sokrates',
    localizedText: {
      'tr': 'SorgulanmamÄ±ÅŸ bir hayat yaÅŸanmaya deÄŸmez.',
      'en': 'The unexamined life is not worth living.',
      'de': 'Ein unhinterfragtes Leben ist nicht lebenswert.',
      'es': 'Una vida sin examen no vale la pena ser vivida.',
      'fr': 'Une vie sans examen ne vaut pas la peine d''Ãªtre vÃ©cue.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Ne yaÅŸandÄ±ÄŸÄ± deÄŸil, ona nasÄ±l tepki verdiÄŸin Ã¶nemlidir.',
      'en': 'It''s not what happens to you, but how you react to it that matters.',
      'de': 'Es kommt nicht darauf an, was dir passiert, sondern wie du darauf reagierst.',
      'es': 'No importa lo que te sucede, sino cÃ³mo reaccionas ante ello.',
      'fr': 'Ce n''est pas ce qui vous arrive, mais la faÃ§on dont vous y rÃ©agissez qui importe.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Her gÃ¼ne sanki son gÃ¼nÃ¼nmÃ¼ÅŸ gibi odaklan.',
      'en': 'Focus on every day as if it were your last.',
      'de': 'Konzentriere dich auf jeden Tag, als wÃ¤re es dein letzter.',
      'es': 'ConcÃ©ntrate en cada dÃ­a como si fuera el Ãºltimo.',
      'fr': 'Concentre-toi sur chaque jour comme si c''Ã©tait le dernier.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'Hangi limana yelken aÃ§tÄ±ÄŸÄ±nÄ± bilmeyen kapayana hiÃ§bir rÃ¼zgar yardÄ±m edemez.',
      'en': 'If one does not know to which port one is sailing, no wind is favorable.',
      'de': 'Wenn man nicht weiÃŸ, welchen Hafen man ansteuert, ist kein Wind gÃ¼nstig.',
      'es': 'Si uno no sabe a quÃ© puerto navega, ningÃºn viento es favorable.',
      'fr': 'Si l''on ne sait vers quel port on navigue, aucun vent n''est favorable.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Hedefine giden yolda rÃ¼zgardan deÄŸil, iradenden gÃ¼Ã§ al.',
      'en': 'On the path to your goal, draw strength from your willpower, not the wind.',
      'de': 'Auf dem Weg zu deinem Ziel schÃ¶pfe Kraft aus deinem Willen, nicht aus dem Wind.',
      'es': 'En el camino hacia tu meta, saca fuerza de tu voluntad, no del viento.',
      'fr': 'Sur le chemin de ton objectif, tire ta force de ta volontÃ©, pas du vent.',
    },
  ),
  Quote(
    author: 'Cicero',
    localizedText: {
      'tr': 'Ã‡aba gÃ¶stermeden elde edilen zafer tatlÄ± deÄŸildir.',
      'en': 'Victory attained without effort is not sweet.',
      'de': 'Ein ohne Anstrengung errungener Sieg ist nicht sÃ¼ÃŸ.',
      'es': 'La victoria alcanzada sin esfuerzo no es dulce.',
      'fr': 'La victoire obtenue sans effort n''est pas douce.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Zihnini bir su gibi dingin tut, kararlarÄ±n kÄ±lÄ±Ã§ gibi keskin olsun.',
      'en': 'Keep your mind calm like water, let your decisions be sharp as a sword.',
      'de': 'Halte deinen Geist ruhig wie Wasser, lass deine Entscheidungen scharf wie ein Schwert sein.',
      'es': 'MantÃ©n tu mente tranquila como el agua, deja que tus decisiones sean afiladas como una espada.',
      'fr': 'Garde ton esprit calme comme l''eau, que tes dÃ©cisions soient tranchantes comme une Ã©pÃ©e.',
    },
  ),
  Quote(
    author: 'Sun Tzu',
    localizedText: {
      'tr': 'Kendini ve dÃ¼ÅŸmanÄ±nÄ± tanÄ±rsan, yÃ¼z savaÅŸtan galip Ã§Ä±karsÄ±n.',
      'en': 'If you know the enemy and know yourself, you need not fear the result of a hundred battles.',
      'de': 'Wenn du den Feind kennst und dich selbst kennst, brauchst du das Ergebnis von hundert Schlachten nicht zu fÃ¼rchten.',
      'es': 'Si conoces al enemigo y te conoces a ti mismo, no debes temer el resultado de cien batallas.',
      'fr': 'Si tu connais l''ennemi et que tu te connais toi-mÃªme, tu n''as pas Ã  craindre le rÃ©sultat de cent batailles.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'SavaÅŸÃ§Ä± pes etmez, sadece bir sonraki hamlesini planlar.',
      'en': 'A warrior never quits; they only plan their next move.',
      'de': 'Ein Krieger gibt niemals auf; er plant nur seinen nÃ¤chsten Schritt.',
      'es': 'Un guerrero nunca se rinde; solo planea su prÃ³ximo movimiento.',
      'fr': 'Un guerrier n''abandonne jamais ; il planifie simplement son prochain coup.',
    },
  ),
  Quote(
    author: 'Epiktetos',
    localizedText: {
      'tr': 'Ã–zgÃ¼rlÃ¼k, arzularÄ±nÄ± kontrol edebilmektir.',
      'en': 'Freedom is the control of one''s desires.',
      'de': 'Freiheit ist die Kontrolle der eigenen Begierden.',
      'es': 'La libertad es el control de los propios deseos.',
      'fr': 'La libertÃ© est le contrÃ´le de ses propres dÃ©sirs.',
    },
  ),
  Quote(
    author: 'Marcus Aurelius',
    localizedText: {
      'tr': 'Ruhun rengi, dÃ¼ÅŸÃ¼ncelerinin rengine bÃ¼rÃ¼nÃ¼r.',
      'en': 'The soul becomes dyed with the color of its thoughts.',
      'de': 'Die Seele nimmt die Farbe ihrer Gedanken an.',
      'es': 'El alma se tiÃ±e del color de sus pensamientos.',
      'fr': 'L''Ã¢me se teinte de la couleur de ses pensÃ©es.',
    },
  ),
  Quote(
    author: 'Seneca',
    localizedText: {
      'tr': 'YaÅŸam bÃ¼yÃ¼k bir mÃ¼cadeledir; asker gibi savaÅŸmalÄ±sÄ±n.',
      'en': 'Life is a battle; you must fight like a soldier.',
      'de': 'Das Leben ist ein Kampf; du musst wie ein Soldat kÃ¤mpfen.',
      'es': 'La vida es una batalla; debes luchar como un soldado.',
      'fr': 'La vie est un combat ; tu dois te battre comme un soldat.',
    },
  ),
  Quote(
    author: 'Bruce Lee',
    localizedText: {
      'tr': 'SÃ¼reÃ§ten keyif al, odaklandÄ±ÄŸÄ±n ÅŸey geliÅŸimindir.',
      'en': 'Enjoy the process; what you focus on is your growth.',
      'de': 'GenieÃŸe den Prozess; worauf du dich konzentrierst, ist dein Wachstum.',
      'es': 'Disfruta el proceso; aquello en lo que te enfocas es tu crecimiento.',
      'fr': 'Profite du processus ; ce sur quoi tu te concentres est ta croissance.',
    },
  ),
  Quote(
    author: 'Theodore Roosevelt',
    localizedText: {
      'tr': 'GÃ¶zlerin yÄ±ldÄ±zlarda olsun, ayaklarÄ±n ise yerde.',
      'en': 'Keep your eyes on the stars, and your feet on the ground.',
      'de': 'Halte deine Augen auf die Sterne gerichtet und deine FÃ¼ÃŸe auf den Boden.',
      'es': 'MantÃ©n tus ojos en las estrellas y tus pies en la tierra.',
      'fr': 'Garde les yeux sur les Ã©toiles et les pieds sur terre.',
    },
  ),
  Quote(
    author: 'Winston Churchill',
    localizedText: {
      'tr': 'UÃ§urtmalar rÃ¼zgar gÃ¼cÃ¼yle deÄŸil, rÃ¼zgara karÅŸÄ± yÃ¼kselir.',
      'en': 'Kites rise highest against the wind, not with it.',
      'de': 'Drachen steigen gegen den Wind am hÃ¶chsten, nicht mit ihm.',
      'es': 'Cometas se elevan mÃ¡s alto contra el viento, no con Ã©l.',
      'fr': 'Les cerfs-volants s''Ã©lÃ¨vent le plus haut contre le vent, pas avec lui.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Mazeretleri yok et, ÅŸampiyonlarÄ±n yolunu aÃ§.',
      'en': 'Destroy excuses, pave the way for champions.',
      'de': 'ZerstÃ¶re Ausreden, ebne den Weg fÃ¼r Champions.',
      'es': 'Destruye las excusas, abre el camino a los campeones.',
      'fr': 'DÃ©truis les excuses, pave la voie aux champions.',
    },
  ),
  Quote(
    author: 'Lao Tzu',
    localizedText: {
      'tr': 'BaÅŸkalarÄ±na hÃ¼kmeden gÃ¼Ã§lÃ¼dÃ¼r, kendine hÃ¼kmeden ise yenilmez.',
      'en': 'He who controls others may be powerful, but he who has mastered himself is mightier still.',
      'de': 'Wer andere beherrscht, mag mÃ¤chtig sein; wer sich selbst beherrscht, ist noch mÃ¤chtiger.',
      'es': 'Quien controla a otros puede ser poderoso, pero quien se domina a sÃ­ mismo es aÃºn mÃ¡s fuerte.',
      'fr': 'Celui qui maÃ®trise les autres est puissant ; celui qui se maÃ®trise lui-mÃªme est encore plus fort.',
    },
  ),
  Quote(
    author: 'Miyamoto Musashi',
    localizedText: {
      'tr': 'Bin gÃ¼n sÃ¼ren antrenman acemiliÄŸi giderir, ten bin gÃ¼n sÃ¼ren antrenman ustalÄ±ÄŸÄ± getirir.',
      'en': 'A thousand days of practice to forge, ten thousand days of practice to refine.',
      'de': 'Tausend Tage Training zum Schmieden, zehntausend Tage Training zum Verfeinern.',
      'es': 'Mil dÃ­as de prÃ¡ctica para forjar, diez mil dÃ­as de prÃ¡ctica para perfeccionar.',
      'fr': 'Mille jours de pratique pour forger, dix mille jours de pratique pour affiner.',
    },
  ),
  Quote(
    author: 'PainToGain',
    localizedText: {
      'tr': 'Zirveye giden yol disiplin taÅŸlarÄ±yla Ã¶rÃ¼lmÃ¼ÅŸtÃ¼r.',
      'en': 'The road to the top is paved with stones of discipline.',
      'de': 'Der Weg nach oben ist mit Steinen der Disziplin gepflastert.',
      'es': 'El camino hacia la cima estÃ¡ empedrado con piedras de disciplina.',
      'fr': 'Le chemin vers le sommet est pavÃ© de pierres de discipline.',
    },
  ),
];
