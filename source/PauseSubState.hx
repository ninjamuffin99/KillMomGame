package;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.addons.ui.FlxSlider;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class PauseSubState extends FlxSubState 
{
	private var _pauseText:FlxText;
	
	private var _musicVolumeSlider:FlxSlider;	
	
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
		_pauseText = new FlxText(0, 0, 0, "PAUSED", 32);
		_pauseText.color = FlxColor.BLUE;
		_pauseText.screenCenter();
		add(_pauseText);
		
		
		_musicVolumeSlider = new FlxSlider(Global, "musicVolume", 100, 100, 0, 1, 500, 50, 10, FlxColor.WHITE, FlxColor.WHITE);
		add(_musicVolumeSlider);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		FlxG.watch.add(Global, "musicVolume");
		FlxG.sound.music.volume = Global.musicVolume;
		
		if (FlxG.keys.justPressed.ENTER)
		{
			close();
		}
		
	}
	
}