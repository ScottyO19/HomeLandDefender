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



class Design_44_44_JetShoot extends ActorScript
{
	public var _CanFire:Bool;
	public var _Fired:Bool;
	public var _XOffset:Float;
	public var _YOffset:Float;
	public var _BulletCreated:Actor;
	public var shooterangle:Float;
	public var bulletangle:Float;
	public var speed:Float;
	public var _Direction:Float;
	public var _Timer:Float;
	public var _PlayerActor:Actor;
	public var bullet:ActorType;
	public var _bullet:Float;
	public var _bullet2:Actor;
	public var _bullet3:ActorType;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Can Fire?", "_CanFire");
		_CanFire = true;
		nameMap.set("Fired", "_Fired");
		_Fired = false;
		nameMap.set("X Offset", "_XOffset");
		_XOffset = 0.0;
		nameMap.set("Y Offset", "_YOffset");
		_YOffset = 0.0;
		nameMap.set("Bullet Created", "_BulletCreated");
		nameMap.set("Inital Shooter Angle", "shooterangle");
		shooterangle = 0.0;
		nameMap.set("Inital Bullet Angle", "bulletangle");
		bulletangle = 270.0;
		nameMap.set("Speed", "speed");
		speed = 0.0;
		nameMap.set("Direction", "_Direction");
		_Direction = 0;
		nameMap.set("Timer", "_Timer");
		_Timer = 0;
		nameMap.set("PlayerActor", "_PlayerActor");
		nameMap.set("Bullet", "bullet");
		nameMap.set("bullet", "_bullet");
		_bullet = 0;
		nameMap.set("bullet_", "_bullet2");
		nameMap.set("bullet__", "_bullet3");
		
	}
	
	override public function init()
	{
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 5, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				createRecycledActor(_bullet3, (actor.getX() + 50), (actor.getY() + 40), Script.FRONT);
				_BulletCreated = getLastCreatedActor();
				_bullet2.setAnimation("2");
				_bullet2.applyImpulse(((Engine.engine.getGameAttribute("Player_x") : Float) - actor.getX()), ((Engine.engine.getGameAttribute("Player_Y") : Float) - actor.getY()), 100);
			}
		}, actor);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}