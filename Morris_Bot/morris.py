#!/usr/bin/env python3
# Morris.py
# Morris Bot
import os
import random
import discord
from discord.ext import commands
from dotenv import load_dotenv

load_dotenv()
token = os.getenv('DISCORD_TOKEN')

client = commands.Bot(command_prefix = '.')

@client.event
async def on_ready():
    print('Morris Bot is ready.')

@client.event
async def on_member_join(member):
    print(f'(member) has joined a server!')

@client.event
async def on_member_remove(member):
    print(f'(member) has left a server!')

@client.command(help='Responds with latency between discord and bot!')
async def ping(ctx):
    await ctx.send(f'Pong! {round(client.latency * 1000)}ms' )

@client.command(aliases=['8ball'], help="Ask the magic 8 ball a question by typing '.8ball ask your question' ")
async def _8ball(ctx, *, question):
    responses = ['It is certain.',
                 'It is decidedly so.',
                 'Without a doubt',
                 'Yes - definately',
                 'You may rely on it.',
                 'As I see it, Yes.',
                 'Most likely.',
                 'Outlook is good',
                 'Yes!',
                 'Signs point to yes.',
                 'Reply hazy, try again.',
                 'Ask again later.',
                 'Better not tell you now.',
                 'Cannot predict now.',
                 'Concentrate and ask again.',
                 "Don't count on it.",
                 'My reply is No.',
                 'My sources say No.',
                 'Outlook not so good.',
                 'Very doubtful.']
    await ctx.send(f'Question: {question}\nAnswer: {random.choice(responses)}')


client.run(token)