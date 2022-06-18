Application ios 15 développée avec XCode 13 sur MacOS Catalina.

---------------------------- ACCESSIBILITÉS : ---------------------------------

En téléchargeant le git ci-présent et en lançant le fichier "ChatRoule_App.xcodeproj" dans le dossier "ChatRoule_App" avec XCode 13 installé sur un Mac, 
vous pouvez accéder : 
- code source du projet réalisé en Swift 5, 
- du framework SwiftUI pour l'User Interface, 
- et SQLite3 concernant la persistence de données.

Vous pouvez également compiler un build et lancer l'application en appuyant sur le bouton play se trouvant dans le compartiment haut du logiciel et en ayant soit :
- téléchargé un simulateur iPhone (IOS 15)
- ou en branchant directement un iPhone par câble et en ayant connecté préablement un compte Apple gratuit ou développeur à XCode dans la partie
"Signing & Calpabilities".





------------------------ PROBLÈMES RÉCURRENTS : ---------------------------------

Si des erreurs apparaissent lors du build de l'application, je vous conseille de suivre les étapes suivantes :

- fermer XCode, aller au niveau du dossier "ChatRoule_App" et supprimer le dossier DerivedData (à côté du fichier "CharRoule_App.xcodeproj"). Il s'agit des caches du projet et il se peut qu'il ait enregistré un chemin de dossier n'existant pas. 
Pas d'inquiétude, la suppression de ce dossier n'endommage pas le projet car il sera regénéré automatiquement à la volée lors de l'ouverture d'XCode.

- Enfin réouvrez XCode et appliquez le raccourcis suivant : " maj + cmd + K ". Cela permet de faire un nettoyage des dossiers de build. 
N'hésitez pas à utiliser cette option autant de fois que nécessaire. 
Souvent une erreur du type : " Command CompileSwift failed with a nonzero exit code" apparaît lorsqu'on a fait un changement dans le code et il est nécessaire de nettoyer le tout avant de relancer la compilation 

