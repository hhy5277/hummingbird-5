/////////////////////////////////////////////////////////////////////////////////////
//
//    Simplified BSD License
//    ======================
//    
//    Copyright 2013-2014 Pascal ECHEMANN. All rights reserved.
//    
//    Redistribution and use in source and binary forms, with or without modification,
//    are permitted provided that the following conditions are met:
//    
//    1. Redistributions of source code must retain the above copyright notice, this
//       list of conditions and the following disclaimer. 
//    
//    2. Redistributions in binary form must reproduce the above copyright notice,
//       this list of conditions and the following disclaimer in the documentation
//       and/or other materials provided with the distribution. 
//    
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//    
//    The views and conclusions contained in the software and documentation are those
//    of the authors and should not be interpreted as representing official policies, 
//    either expressed or implied, of the copyright holders.
//    
/////////////////////////////////////////////////////////////////////////////////////

package org.flashapi.hummingbird.view {
	
	// -----------------------------------------------------------
	//  AbstractMobileView.as
	// -----------------------------------------------------------

	/**
	 *  @author Pascal ECHEMANN
	 *  @version 1.0.0, 24/11/2013 14:54
	 *  @see http://www.flashapi.org/
	 */
	
	import mx.core.FlexGlobals;
	import org.flashapi.hummingbird.events.DependencyEvent;
	import spark.components.Application;
	import spark.components.View;
	
	//--------------------------------------------------------------------------
	//
	//  Events
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Dispatched when the dependency injection is complete on this <code>IFlexMobileView</code>
	 * 	object.
	 *
	 *  @eventType org.flashapi.hummingbird.events.DependencyEvent.DEPENDENCY_COMPLETE
	 */
	[Event(name="dependencyComplete", type="org.flashapi.hummingbird.events.DependencyEvent")]
	
	/**
	 * 	Convenient superclass for view implementations based on the <code>View</code>
	 * 	class, using the Template Method design pattern.
	 */
	public class AbstractMobileView extends View implements IFlexMobileView {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor. 	Creates a new <code>AbstractMobileView</code> instance.
		 */
		public function AbstractMobileView() {
			super();
			this.initObj();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getter / setter properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Returns a reference to the main <code>Application</code> instance.
		 */
		public function get application():Application {
			return Application(FlexGlobals.topLevelApplication);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@inheritDoc
		 */
		public function finalize():void { }
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	Called when the Dependency Injection process is completely performed on
		 * 	this MVC object.
		 */
		protected function onDependencyComplete():void { }
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 	@private
		 * 
		 * 	Initializes this MVC object.
		 */
		private function initObj():void {
			this.addEventListener(DependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
		}
		
		/**
		 * 	@private
		 * 
		 * 	Event handler invoked when the Dependency Injection process is completely 
		 * 	performed on this MVC object.
		 */
		private function dependencyCompleteHandler(e:DependencyEvent):void {
			this.removeEventListener(DependencyEvent.DEPENDENCY_COMPLETE, this.dependencyCompleteHandler);
			this.onDependencyComplete();
		}
	}
}