package android.support.v4.widget;

import android.content.ComponentName;
import android.content.Context;
import android.os.Build.VERSION;
import android.view.View;

public class SearchViewCompat
{
  private static final SearchViewCompatImpl IMPL;

  static
  {
    if (Build.VERSION.SDK_INT >= 14)
      IMPL = new SearchViewCompatIcsImpl();
    while (true)
    {
      return;
      if (Build.VERSION.SDK_INT >= 11)
      {
        IMPL = new SearchViewCompatHoneycombImpl();
        continue;
      }
      IMPL = new SearchViewCompatStubImpl();
    }
  }

  private SearchViewCompat(Context paramContext)
  {
  }

  public static CharSequence getQuery(View paramView)
  {
    return IMPL.getQuery(paramView);
  }

  public static boolean isIconified(View paramView)
  {
    return IMPL.isIconified(paramView);
  }

  public static boolean isQueryRefinementEnabled(View paramView)
  {
    return IMPL.isQueryRefinementEnabled(paramView);
  }

  public static boolean isSubmitButtonEnabled(View paramView)
  {
    return IMPL.isSubmitButtonEnabled(paramView);
  }

  public static View newSearchView(Context paramContext)
  {
    return IMPL.newSearchView(paramContext);
  }

  public static void setIconified(View paramView, boolean paramBoolean)
  {
    IMPL.setIconified(paramView, paramBoolean);
  }

  public static void setImeOptions(View paramView, int paramInt)
  {
    IMPL.setImeOptions(paramView, paramInt);
  }

  public static void setInputType(View paramView, int paramInt)
  {
    IMPL.setInputType(paramView, paramInt);
  }

  public static void setMaxWidth(View paramView, int paramInt)
  {
    IMPL.setMaxWidth(paramView, paramInt);
  }

  public static void setOnCloseListener(View paramView, OnCloseListenerCompat paramOnCloseListenerCompat)
  {
    SearchViewCompatImpl localSearchViewCompatImpl = IMPL;
    Object localObject = paramOnCloseListenerCompat.mListener;
    localSearchViewCompatImpl.setOnCloseListener(paramView, localObject);
  }

  public static void setOnQueryTextListener(View paramView, OnQueryTextListenerCompat paramOnQueryTextListenerCompat)
  {
    SearchViewCompatImpl localSearchViewCompatImpl = IMPL;
    Object localObject = paramOnQueryTextListenerCompat.mListener;
    localSearchViewCompatImpl.setOnQueryTextListener(paramView, localObject);
  }

  public static void setQuery(View paramView, CharSequence paramCharSequence, boolean paramBoolean)
  {
    IMPL.setQuery(paramView, paramCharSequence, paramBoolean);
  }

  public static void setQueryHint(View paramView, CharSequence paramCharSequence)
  {
    IMPL.setQueryHint(paramView, paramCharSequence);
  }

  public static void setQueryRefinementEnabled(View paramView, boolean paramBoolean)
  {
    IMPL.setQueryRefinementEnabled(paramView, paramBoolean);
  }

  public static void setSearchableInfo(View paramView, ComponentName paramComponentName)
  {
    IMPL.setSearchableInfo(paramView, paramComponentName);
  }

  public static void setSubmitButtonEnabled(View paramView, boolean paramBoolean)
  {
    IMPL.setSubmitButtonEnabled(paramView, paramBoolean);
  }

  public abstract class OnCloseListenerCompat
  {
    final Object mListener;

    public OnCloseListenerCompat()
    {
      this$1 = SearchViewCompat.IMPL.newOnCloseListener(this);
      this.mListener = this$1;
    }

    public boolean onClose()
    {
      return null;
    }
  }

  public abstract class OnQueryTextListenerCompat
  {
    final Object mListener;

    public OnQueryTextListenerCompat()
    {
      this$1 = SearchViewCompat.IMPL.newOnQueryTextListener(this);
      this.mListener = this$1;
    }

    public boolean onQueryTextChange(String paramString)
    {
      return null;
    }

    public boolean onQueryTextSubmit(String paramString)
    {
      return null;
    }
  }

  class SearchViewCompatIcsImpl extends SearchViewCompat.SearchViewCompatHoneycombImpl
  {
    public View newSearchView(Context paramContext)
    {
      return SearchViewCompatIcs.newSearchView(paramContext);
    }

    public void setImeOptions(View paramView, int paramInt)
    {
      SearchViewCompatIcs.setImeOptions(paramView, paramInt);
    }

    public void setInputType(View paramView, int paramInt)
    {
      SearchViewCompatIcs.setInputType(paramView, paramInt);
    }
  }

  class SearchViewCompatHoneycombImpl extends SearchViewCompat.SearchViewCompatStubImpl
  {
    public CharSequence getQuery(View paramView)
    {
      return SearchViewCompatHoneycomb.getQuery(paramView);
    }

    public boolean isIconified(View paramView)
    {
      return SearchViewCompatHoneycomb.isIconified(paramView);
    }

    public boolean isQueryRefinementEnabled(View paramView)
    {
      return SearchViewCompatHoneycomb.isQueryRefinementEnabled(paramView);
    }

    public boolean isSubmitButtonEnabled(View paramView)
    {
      return SearchViewCompatHoneycomb.isSubmitButtonEnabled(paramView);
    }

    public Object newOnCloseListener(SearchViewCompat.OnCloseListenerCompat paramOnCloseListenerCompat)
    {
      return SearchViewCompatHoneycomb.newOnCloseListener(new SearchViewCompat.SearchViewCompatHoneycombImpl.2(this, paramOnCloseListenerCompat));
    }

    public Object newOnQueryTextListener(SearchViewCompat.OnQueryTextListenerCompat paramOnQueryTextListenerCompat)
    {
      return SearchViewCompatHoneycomb.newOnQueryTextListener(new SearchViewCompat.SearchViewCompatHoneycombImpl.1(this, paramOnQueryTextListenerCompat));
    }

    public View newSearchView(Context paramContext)
    {
      return SearchViewCompatHoneycomb.newSearchView(paramContext);
    }

    public void setIconified(View paramView, boolean paramBoolean)
    {
      SearchViewCompatHoneycomb.setIconified(paramView, paramBoolean);
    }

    public void setMaxWidth(View paramView, int paramInt)
    {
      SearchViewCompatHoneycomb.setMaxWidth(paramView, paramInt);
    }

    public void setOnCloseListener(Object paramObject1, Object paramObject2)
    {
      SearchViewCompatHoneycomb.setOnCloseListener(paramObject1, paramObject2);
    }

    public void setOnQueryTextListener(Object paramObject1, Object paramObject2)
    {
      SearchViewCompatHoneycomb.setOnQueryTextListener(paramObject1, paramObject2);
    }

    public void setQuery(View paramView, CharSequence paramCharSequence, boolean paramBoolean)
    {
      SearchViewCompatHoneycomb.setQuery(paramView, paramCharSequence, paramBoolean);
    }

    public void setQueryHint(View paramView, CharSequence paramCharSequence)
    {
      SearchViewCompatHoneycomb.setQueryHint(paramView, paramCharSequence);
    }

    public void setQueryRefinementEnabled(View paramView, boolean paramBoolean)
    {
      SearchViewCompatHoneycomb.setQueryRefinementEnabled(paramView, paramBoolean);
    }

    public void setSearchableInfo(View paramView, ComponentName paramComponentName)
    {
      SearchViewCompatHoneycomb.setSearchableInfo(paramView, paramComponentName);
    }

    public void setSubmitButtonEnabled(View paramView, boolean paramBoolean)
    {
      SearchViewCompatHoneycomb.setSubmitButtonEnabled(paramView, paramBoolean);
    }
  }

  class SearchViewCompatStubImpl
    implements SearchViewCompat.SearchViewCompatImpl
  {
    public CharSequence getQuery(View paramView)
    {
      return null;
    }

    public boolean isIconified(View paramView)
    {
      return true;
    }

    public boolean isQueryRefinementEnabled(View paramView)
    {
      return null;
    }

    public boolean isSubmitButtonEnabled(View paramView)
    {
      return null;
    }

    public Object newOnCloseListener(SearchViewCompat.OnCloseListenerCompat paramOnCloseListenerCompat)
    {
      return null;
    }

    public Object newOnQueryTextListener(SearchViewCompat.OnQueryTextListenerCompat paramOnQueryTextListenerCompat)
    {
      return null;
    }

    public View newSearchView(Context paramContext)
    {
      return null;
    }

    public void setIconified(View paramView, boolean paramBoolean)
    {
    }

    public void setImeOptions(View paramView, int paramInt)
    {
    }

    public void setInputType(View paramView, int paramInt)
    {
    }

    public void setMaxWidth(View paramView, int paramInt)
    {
    }

    public void setOnCloseListener(Object paramObject1, Object paramObject2)
    {
    }

    public void setOnQueryTextListener(Object paramObject1, Object paramObject2)
    {
    }

    public void setQuery(View paramView, CharSequence paramCharSequence, boolean paramBoolean)
    {
    }

    public void setQueryHint(View paramView, CharSequence paramCharSequence)
    {
    }

    public void setQueryRefinementEnabled(View paramView, boolean paramBoolean)
    {
    }

    public void setSearchableInfo(View paramView, ComponentName paramComponentName)
    {
    }

    public void setSubmitButtonEnabled(View paramView, boolean paramBoolean)
    {
    }
  }

  abstract interface SearchViewCompatImpl
  {
    public abstract CharSequence getQuery(View paramView);

    public abstract boolean isIconified(View paramView);

    public abstract boolean isQueryRefinementEnabled(View paramView);

    public abstract boolean isSubmitButtonEnabled(View paramView);

    public abstract Object newOnCloseListener(SearchViewCompat.OnCloseListenerCompat paramOnCloseListenerCompat);

    public abstract Object newOnQueryTextListener(SearchViewCompat.OnQueryTextListenerCompat paramOnQueryTextListenerCompat);

    public abstract View newSearchView(Context paramContext);

    public abstract void setIconified(View paramView, boolean paramBoolean);

    public abstract void setImeOptions(View paramView, int paramInt);

    public abstract void setInputType(View paramView, int paramInt);

    public abstract void setMaxWidth(View paramView, int paramInt);

    public abstract void setOnCloseListener(Object paramObject1, Object paramObject2);

    public abstract void setOnQueryTextListener(Object paramObject1, Object paramObject2);

    public abstract void setQuery(View paramView, CharSequence paramCharSequence, boolean paramBoolean);

    public abstract void setQueryHint(View paramView, CharSequence paramCharSequence);

    public abstract void setQueryRefinementEnabled(View paramView, boolean paramBoolean);

    public abstract void setSearchableInfo(View paramView, ComponentName paramComponentName);

    public abstract void setSubmitButtonEnabled(View paramView, boolean paramBoolean);
  }
}