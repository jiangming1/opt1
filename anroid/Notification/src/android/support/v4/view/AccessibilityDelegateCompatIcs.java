package android.support.v4.view;

import android.view.View;
import android.view.View.AccessibilityDelegate;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

class AccessibilityDelegateCompatIcs
{
  public static boolean dispatchPopulateAccessibilityEvent(Object paramObject, View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    return ((View.AccessibilityDelegate)paramObject).dispatchPopulateAccessibilityEvent(paramView, paramAccessibilityEvent);
  }

  public static Object newAccessibilityDelegateBridge(AccessibilityDelegateBridge paramAccessibilityDelegateBridge)
  {
    return new AccessibilityDelegateCompatIcs.1(paramAccessibilityDelegateBridge);
  }

  public static Object newAccessibilityDelegateDefaultImpl()
  {
    return new View.AccessibilityDelegate();
  }

  public static void onInitializeAccessibilityEvent(Object paramObject, View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    ((View.AccessibilityDelegate)paramObject).onInitializeAccessibilityEvent(paramView, paramAccessibilityEvent);
  }

  public static void onInitializeAccessibilityNodeInfo(Object paramObject1, View paramView, Object paramObject2)
  {
    View.AccessibilityDelegate localAccessibilityDelegate = (View.AccessibilityDelegate)paramObject1;
    AccessibilityNodeInfo localAccessibilityNodeInfo = (AccessibilityNodeInfo)paramObject2;
    paramObject1.onInitializeAccessibilityNodeInfo(paramView, paramObject2);
  }

  public static void onPopulateAccessibilityEvent(Object paramObject, View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    ((View.AccessibilityDelegate)paramObject).onPopulateAccessibilityEvent(paramView, paramAccessibilityEvent);
  }

  public static boolean onRequestSendAccessibilityEvent(Object paramObject, ViewGroup paramViewGroup, View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    return ((View.AccessibilityDelegate)paramObject).onRequestSendAccessibilityEvent(paramViewGroup, paramView, paramAccessibilityEvent);
  }

  public static void sendAccessibilityEvent(Object paramObject, View paramView, int paramInt)
  {
    ((View.AccessibilityDelegate)paramObject).sendAccessibilityEvent(paramView, paramInt);
  }

  public static void sendAccessibilityEventUnchecked(Object paramObject, View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    ((View.AccessibilityDelegate)paramObject).sendAccessibilityEventUnchecked(paramView, paramAccessibilityEvent);
  }

  public abstract interface AccessibilityDelegateBridge
  {
    public abstract boolean dispatchPopulateAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent);

    public abstract void onInitializeAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent);

    public abstract void onInitializeAccessibilityNodeInfo(View paramView, Object paramObject);

    public abstract void onPopulateAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent);

    public abstract boolean onRequestSendAccessibilityEvent(ViewGroup paramViewGroup, View paramView, AccessibilityEvent paramAccessibilityEvent);

    public abstract void sendAccessibilityEvent(View paramView, int paramInt);

    public abstract void sendAccessibilityEventUnchecked(View paramView, AccessibilityEvent paramAccessibilityEvent);
  }
}