package js;

/**
 * See https://github.com/drdk/dr-font-support.
 */
#if !jslibs_node
@:native("fontSupport")
#else
@:jsRequire("jslibs-fontsupport")
#end
extern class FontSupport
{
	#if !jslibs_node
	private static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/FontSupport.js");
	}
	#end
	
	static inline function isFormatSupported(format:String, callb:Bool->Void) : Void run(callb, format);
	static inline function getSupportedFormat(formats:Array<String>, callb:String->Void) : Void run(callb, formats);
	static inline function getSupportedFormats(callb:{ woff2:Bool, woff:Bool, ttf:Bool, svg:Bool }->Void) : Void run(callb);
	
	@:selfCall private static function run(callb:Dynamic, ?formats:Dynamic):Void;
}
