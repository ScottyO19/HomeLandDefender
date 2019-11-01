package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_7 extends SceneScript
{
	public var _WinNumber:Float;
	public var _Assister:Actor;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("WinNumber", "_WinNumber");
		_WinNumber = 0.0;
		nameMap.set("Assister", "_Assister");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		Engine.engine.setGameAttribute("Ammo", 11);
		_WinNumber = 8;
		if(((Engine.engine.getGameAttribute("Assist") : Bool) == true))
		{
			createRecycledActor(getActorType(1), (getActor(1).getX() - (getActor(1).getWidth())), getActor(1).getY(), Script.FRONT);
			_Assister = getLastCreatedActor();
		}
		
		/* ======================== When Creating ========================= */
		loopSoundOnChannel(getSound(55), 0);
		
		/* ======================= Member of Group ======================== */
		addWhenTypeGroupKilledListener(getActorGroup(4), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				_WinNumber = (_WinNumber - 1);
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("ESC", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && pressed)
			{
				switchScene(GameModel.get().scenes.get(9).getID(), null, createCrossfadeTransition(.25));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((_WinNumber < 1))
				{
					switchScene(GameModel.get().scenes.get(8).getID(), null, createCrossfadeTransition(.25));
				}
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.drawString("" + "Ammo:", 12, 11);
				g.drawString("" + (Engine.engine.getGameAttribute("Ammo") : Float), 75, 11);
				g.drawString("" + " /11", 80, 11);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}