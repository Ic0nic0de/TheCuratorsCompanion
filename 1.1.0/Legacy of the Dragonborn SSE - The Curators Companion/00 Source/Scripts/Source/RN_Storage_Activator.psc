Scriptname RN_Storage_Activator extends ObjectReference  

ObjectReference Property RN_Storage_Container Auto

Event OnActivate(ObjectReference akActionRef)

      RN_Storage_Container.Activate(Game.GetPlayer())
endevent

