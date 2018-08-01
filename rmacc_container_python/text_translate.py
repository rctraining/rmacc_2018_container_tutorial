from translate import Translator

#Enter languages and string to translate
input_language="English"
output_language="German"
translate_string="Good Morning!"

#Now translate
translator= Translator(from_lang=input_language, to_lang=output_language)
translation = translator.translate(translate_string)

#Report results
print ("Translating from " + input_language + " to " + output_language + " :")
print (translate_string + " = " + translation)
