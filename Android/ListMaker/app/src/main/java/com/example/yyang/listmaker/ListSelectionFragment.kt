package com.example.yyang.listmaker

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class ListSelectionFragment : Fragment(), ListSelectionRecyclerViewClickListener {
    interface OnListItemFragmentInteractionListener {
        fun onListItemClicked(list: TaskList)
    }
    override fun listItemClicked(list: TaskList) {
        listener?.onListItemClicked(list)
    }
    lateinit var listsRecyclerView: RecyclerView
    lateinit var listDataManager: ListDataManager

    // 1
    private var listener: OnListItemFragmentInteractionListener? = null

    // 2
    companion object {
        fun newInstance(): ListSelectionFragment {
            val fragment = ListSelectionFragment()
            return fragment
        }
    }
    // 3
    override fun onAttach(context: Context) {
        super.onAttach(context)
        if (context is OnListItemFragmentInteractionListener) {
            listener = context
            listDataManager = ListDataManager(context)
        } else {
            throw RuntimeException(context.toString() + " must implement OnListItemFragmentInteractionListener")
        }
    }
    // 4
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }
    // 5
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_list_selection, container,
            false)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        val lists = listDataManager.readLists()
        view?.let {
            listsRecyclerView = it.findViewById(R.id.List_recyclerview)
            listsRecyclerView.layoutManager = LinearLayoutManager(activity)
            listsRecyclerView.adapter = ListSelectionRecyclerViewAdapter(lists, this)
        }

    }

    // 6
    override fun onDetach() {
        super.onDetach()
        listener = null
    }



    fun addList(list : TaskList) {
        listDataManager.saveList(list)
        val recyclerAdapter = listsRecyclerView.adapter as ListSelectionRecyclerViewAdapter
        recyclerAdapter.addList(list)
    }

    fun saveList(list: TaskList) {
        listDataManager.saveList(list)
        updateLists()
    }

    private fun updateLists() {
        val lists = listDataManager.readLists()
        listsRecyclerView.adapter = ListSelectionRecyclerViewAdapter(lists, this)
    }
}
